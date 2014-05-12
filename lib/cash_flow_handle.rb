###########################################
require 'date'
module ContractCashFlowControl
  class CashFlowControl
    def create_cf(contract)
      case contract.repaymentType
        when 1
          #TODO 本息一次付清（两条cf,第二条的日期由之前填入的contract.endDate决定）
          create_cf_1(contract)
        when 2
          #按月付息，本金一次付清
          create_cf_2(contract)
        when 3
          #本息按月支付
          create_cf_3(contract)
        when 4
          #按年付息，本金一次结清
          create_cf_4(contract)
        when 5
          #本息按年付清
          create_cf_5(contract)
        else

        #flowType没有相应函数的情况，创建Flow。
      end
      # TODO 【未完成】折扣体系
      case  contract.condition.discountType
        when 0 #无折扣
        when 1 #利息折扣
        when 2 #本金折扣
        else
      end
      #对contract的repay_amount赋值
    end
    def cf_after_repay(contract,repayment)
      # TODO 还款后产生现金流。已完成设计
      if first_cf_0(contract.id)

      caclu_date = repayment.execute_time.end_of_month
      amount = repayment.cash_amount
      contract_id = contract.id
      if contract.open_item.to_i > 0
        if contract.open_item >= repayment.cash_amount
          #create one cf ， which flowType = where cf.status ==1
          first_0_cf = first_cf_0(contract_id)
          cash_flow = contract.cash_flows.build
          flow_type = first_0_cf.flowType.to_i + 3100
          cf_init(cash_flow,contract,flow_type)
          cash_flow.amount = repayment.cash_amount
          cash_flow.calcuDate = caclu_date
          cash_flow.caluFrom = first_0_cf.caluFrom
          cash_flow.caluUntil = first_0_cf.caluUntil
          cash_flow.status = 1
          cash_flow.creditSide = false
          cash_flow.save
          #open_item修改
          contract.open_item -= repayment.cash_amount
          contract.save
        else
          # contract.open_item < repayment.cash_amount
          # create one cf amount = open_item
          # 清0 open_item
          first_0_cf = first_cf_0(contract_id)
          cash_flow = contract.cash_flows.build
          flow_type = first_0_cf.flowType.to_i + 3100
          cf_init(cash_flow,contract,flow_type)
          cash_flow.amount = contract.open_item
          cash_flow.calcuDate = caclu_date
          cash_flow.caluFrom = first_0_cf.caluFrom
          cash_flow.caluUntil = first_0_cf.caluUntil
          cash_flow.status = 1
          cash_flow.creditSide = false
          cash_flow.save!
          #一个cash_flow完成
          first_0_cf.status = 1
          first_0_cf.save!
          #open_item修改
          amount = amount - contract.open_item
          #将open_item归零
          contract.open_item = 0
          contract.save!
        end
        if CashFlow.where(status: 0, contract_id:contract_id)
        else
          contract.status = 7
          contract.update_attributes(:status => 7)
        end
      end

      if contract.open_item.to_i == 0
        first_0_cf = first_cf_0(contract_id)
        until amount < first_0_cf.amount
          cash_flow = contract.cash_flows.build
          first_0_cf = first_cf_0(contract_id)
          flow_type = first_0_cf.flowType.to_i + 3100
          cf_init(cash_flow,contract,flow_type)
          cash_flow.amount = first_0_cf.amount
          cash_flow.calcuDate = caclu_date
          cash_flow.caluFrom = first_0_cf.caluFrom
          cash_flow.caluUntil = first_0_cf.caluUntil
          cash_flow.status = 1
          cash_flow.creditSide = false
          cash_flow.save!
          amount -= first_0_cf.amount
          #一个cash_flow完成
          first_0_cf.status = 1
          first_0_cf.save!
        end

        if amount > 0 && amount < first_cf_0(contract_id).amount
          #creat_cf
          cash_flow = contract.cash_flows.build
          first_0_cf = first_cf_0(contract_id)
          flow_type = first_0_cf.flowType.to_i + 3100
          cf_init(cash_flow,contract,flow_type)
          cash_flow.amount = amount
          cash_flow.calcuDate = caclu_date
          cash_flow.caluFrom = first_0_cf.caluFrom
          cash_flow.caluUntil = first_0_cf.caluUntil
          cash_flow.status = 1
          cash_flow.creditSide = false
          cash_flow.save!
          #修改contract.open_item
          contract.open_item = first_0_cf.amount - amount
          contract.save!
        end
      end
    end
    else


    end
    # 1 首先分辨repaymentType，然后分配不同CF函数……^_^
    #2 根据repeymentType书写CF初始化函数
    #3 每次还款，只需填入合同号（找到相应CF用），金额，日期（自动计算罚息，填入CF）
    def create_cf_1(contract)
      #在借款方放款之后,生成相应现金流.Repayment == 1. 本息一次付清
      #创建第一条CF记录
      cash_flow1 = contract.cash_flows.build
      cash_flow1.amount = contract.amount
      cash_flow1.calcuDate = contract.condition.fixedFrom
      cash_flow1.flowType = 1
      cash_flow1.flowName = FlowType.find_by_flowNum(cash_flow1.flowType).flowName
      cash_flow1.PC = contract.currency
      cash_flow1.PCname = Pc.find(contract.currency).name
      cash_flow1.status = 1
      cash_flow1.creditSide = true
      cash_flow1.save
      #创建第二条CF记录,应收利息
      #初始化数据
      cash_flow2 = contract.cash_flows.build
      cash_flow2.flowType = 110
      cash_flow2.flowName = FlowType.find_by_flowNum(cash_flow2.flowType).flowName
      cash_flow2.PC = contract.currency
      cash_flow2.PCname = Pc.find(contract.currency).name
      cash_flow2.calcuDate = contract.endDate
      cash_flow2.basisAmount = contract.amount
      cash_flow2.caluFrom = contract.condition.fixedFrom
      cash_flow2.caluUntil = contract.condition.fixedUntil
      cash_flow2.centage = contract.defaulInt
      cash_flow2.dueDate = cash_flow2.caluUntil
      cash_flow2.status = 0
      cash_flow2.creditSide = true
      #数据初始化后,还需要通过condition与conditionItem.
      # #然后是计算,对amount赋值
      days_num = (contract.condition.fixedUntil - contract.condition.fixedFrom).to_i + 1
      cash_flow2.amount  = calu_interest_amount(days_num,contract)
      cash_flow2.save
      #创建第三条CF记录,应收本金头寸
      #初始化数据
      cash_flow3 = contract.cash_flows.build
      cash_flow3.flowType = 115
      cash_flow3.flowName = FlowType.find_by_flowNum(cash_flow3.flowType).flowName
      cash_flow3.PC = contract.currency
      cash_flow3.PCname = Pc.find(contract.currency).name
      cash_flow3.calcuDate = contract.endDate
      cash_flow3.basisAmount = contract.amount
      cash_flow3.caluFrom = contract.condition.fixedFrom
      cash_flow3.caluUntil = contract.condition.fixedUntil
      cash_flow3.centage = contract.defaulInt
      cash_flow3.dueDate = cash_flow3.caluUntil
      cash_flow3.creditSide = true
      cash_flow3.status = 0
      #数据初始化后,还需要通过condition与conditionItem.
      # #然后是计算,对amount赋值
      cash_flow3.amount  = cash_flow1.amount
      cash_flow3.save
    end
    def create_cf_2(contract)
      #按月支付利息
    end
    def create_cf_3(contract)
      #按月支付本息
      #准备需要用到的数据
      day_sum = (contract.condition.fixedUntil - contract.condition.fixedFrom).to_i + 1
      #支付现金流
      #总应收利息计算

      build_cf_disbursement(contract)
           #if contract.condition_items

        calu_date = contract.condition.fixedFrom

        until calu_date >= contract.condition.fixedUntil
          #应收利息
          @cash_flow = contract.cash_flows.build
          int_amount = calu_interest_amount(day_sum,contract)
          cacul_t = calu_date.end_of_month
          days_num =  (cacul_t - calu_date).to_i
          cf_init(@cash_flow, contract, 110)
          #开始计算利息
          @cash_flow.amount = int_amount * days_num / day_sum
          @cash_flow.caluFrom = calu_date
          @cash_flow.caluUntil = cacul_t
          @cash_flow.calcuDate = @cash_flow.caluUntil
          #对calu_date加一个月

          @cash_flow.save!
          #应收本金
          @cash_flow1 = contract.cash_flows.build
          cf_init(@cash_flow1, contract, 115)
          #开始计算利息
          @cash_flow1.amount = contract.amount * days_num / day_sum
          @cash_flow1.caluFrom = calu_date
          @cash_flow1.caluUntil = cacul_t
          @cash_flow1.calcuDate = @cash_flow1.caluUntil
          #对calu_date加一个月
          calu_date = calu_date.next_month
          @cash_flow1.save!
        end

    #  else
        #做点没有conditionItem的事情
     # end


    end
    def create_cf_4(contract)
      #按季度支付利息，本金一次付清
    end
    def create_cf_5(contract)
      #按季度支付本息
    end
    def build_cf_disbursement(contract)
      cash_flow1 = contract.cash_flows.build
      #cash_flow初始化
      cf_init(cash_flow1,contract,1)
      cash_flow1.save!
    end
    def cf_init(cash_flow, contract,flow_type)
     if flow_type == 1
       cash_flow.amount = contract.amount
       cash_flow.calcuDate = contract.condition.fixedFrom
       cash_flow.flowType = flow_type
       cash_flow.flowName = FlowType.find_by_flowNum(flow_type).flowName
       cash_flow.PC = contract.currency
       cash_flow.PCname = Pc.find(contract.currency).name
       cash_flow.status = 1
       cash_flow.creditSide = true
     else
       cash_flow.flowType = flow_type
       cash_flow.flowName = FlowType.find_by_flowNum(flow_type).flowName
       cash_flow.PC = contract.currency
       cash_flow.PCname = Pc.find(contract.currency).name
       cash_flow.basisAmount = contract.amount
       cash_flow.centage = contract.defaulInt
       cash_flow.status = 0
       cash_flow.creditSide = true
     end
     end
    def calu_interest_amount(days, contract)
      contract.amount.to_i * contract.defaulInt.to_i / 100.0 * days.to_i / 365
    end

    def calu_date_by_range()
      #输出range范围内每个月都是最后一天。
      range = Date.parse("February 1, 2013")..Date.parse("January 15, 2014")
      range.to_a.map {|date| Date.new(date.year,date.month,1)}.uniq.map {|date| date.next_month.prev_day}
      "xkl"
    end
    def calu_day_num()
      hh=DateTime.parse(
          "2008-02-03"
      ) - DateTime.parse("2008-01-20")
      hh.each do |d|
        puts d
      end
    end
    def days_between(date1, date2)
      d1 = Date.parse(date1)
      d2 = Date.parse(date2)
      (d2 - d1).to_i
    end
    def first_cf_0(contract_id)
      CashFlow.where(status: 0, contract_id:contract_id).first
    end
  end

end