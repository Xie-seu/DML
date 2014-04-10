class ContractCashFlowController < ApplicationController
  before_filter :find_contract
  def index
  #用于展示现金流量表的函数
  #1,当系统产生放款操作之后，创建一个cash_flow，自动
  #2.当借款人执行还款操作时，创建一个cash_flow，输入：（可以自己设置：全部内容。或者只输入amount，系统自动生成其他）
  #3，关于冲销，罚息，逾期项本金化，也需要有设计

  end
def find_contract
  @contract = Contract.find(params[:contract_id])
end
end
