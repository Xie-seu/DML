###########################################
module ContractCashFlowControl
  class CashFlowControl
    def create_cf(contract,flow_type)
      case flow_type
        when 1
          #Flow_type 1 资产_贷款支出
          @cash_flow = contract.cash_flows.build
          create_cf_disbursement(contract, @cash_flow)
        when 2
          #
        when 3
          #

        else
          @cash_flow = contract.cash_flows.build
        #flowType没有相应函数的情况，创建Flow。
      end
    end
    def create_cf_disbursement(contract, cash_flow)
      @disbursement = contract.disbursement
      cash_flow.amount = @disbursement.grossPayAmount
      cash_flow.calcuDate = @disbursement.paymentDate
      cash_flow.flowType = @disbursement.flowType
      cash_flow.flowName = FlowType.find_by_flowNum(cash_flow.flowType).flowName
      cash_flow.save
    end
  end
end