module DisbursementsHelper
end
# TODO disbursement模块需要用到的函数。
module DisbursementControl
  # 流程：1.创建支付订单 内容：接受外部修改前，将部分normal值提前填入。
  def create_disbursement(contract)
    @contract = contract
    if @contract.disbursement
      @contract.status = 5
      @contract.save
      redirect_to contract_url(@contract.id)
    else
      @disbursement = @contract.build_disbursement
      @disbursement.repaymentType = @contract.repaymentType
      @disbursement.postingControl = 1 #自动记账

      if @contract.repaymentType == 2
        @disbursement.grossPayAmount = @contract.amount/12
        @disbursement.currentPayment = @disbursement.grossPayAmount
        @disbursement.nominalPayment = @disbursement.grossPayAmount
      else
        @disbursement.grossPayAmount = @contract.amount
        @disbursement.currentPayment = @disbursement.grossPayAmount
        @disbursement.nominalPayment = @disbursement.grossPayAmount
      end
      @contract.status = 5
      @disbursement.disbursementRate = @contract.condition.disbursementRate
      @disbursement.disbursementInt = 0#支付利率默认为0

    end
  end
  # 流程 2.由于产生了现金流(真实现金流)。所以产生对应现金流量表
  def create_cashflow_table
    #调用函数

  end

end