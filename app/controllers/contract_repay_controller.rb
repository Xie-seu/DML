class ContractRepayController < ApplicationController
  require 'cash_flow_handle'
  before_filter :find_contract
  def index
    @repayments = Repayment.find_all_by_contract_id(@contract.id)
  end
  def show
    render "contracts/show"
  end
  def new
    @repayment = @contract.repayments.build
  end
  def create
    @repayment = @contract.repayments.build(params[:repayment])
    if @repayment.save
      #TODO create CF
      ContractCashFlowControl::CashFlowControl.new.cf_after_repay(@contract,@repayment)
      redirect_to  contract_cash_flows_url(@contract)
    else
      render :action => :new
    end
  end

  def find_contract
    @contract = Contract.find(params[:contract_id])
  end
end
