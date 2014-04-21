require 'cash_flow_handle'
module ContractsHelper

  #用于View的函数们
  def status_in_form(x)
    if @contract.status == nil
      x.select :status, [1,2]
    else
      x.select :status,[2,3]
    end
  end
  def status_when_withdraw
    @contract.status = 8
    @contract.save
  end
  def contract_reduce
    @contract.status = 6
    @contract.save
  end
  def status_after_commit
    @contract.update_attribute( :status , 3)
  end
  def contract_approve
    @contract.status = 4
    @contract.save
  end

  def contract_reject
    @contract.status = 2
    @contract.save
  end
  def set_contract_init(contract)
    contract.save!
    @mortgage_loan = contract.build_mortgage_loan unless contract.mortgage_loan
    @condition = contract.build_condition unless contract.condition
    @contract.mortgage_loan.contracCurrency = @contract.currency
    @contract.mortgage_loan.term = @contract.term
    contract
  end
  def set_contract(contract)

    @mortgage_loan = contract.build_mortgage_loan unless contract.mortgage_loan
    @condition = contract.build_condition unless contract.condition
    @contract.mortgage_loan.contracCurrency = @contract.currency
    @contract.mortgage_loan.term = @contract.term
    contract
  end
  def find_BP(contract)
    link_to "#{BusinessPartner.find(contract.browser).name}",business_partner_path(contract.browser)
  end

end
module ContractsControl
  #用于Contract_controller的函数们
 def change_amount(contract, amount)
    @contract = contract
    @contract.amount = amount
  end

end
