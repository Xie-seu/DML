module ContractsHelper
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
  def set_contract(contract)
    contract.build_mortgage_loan unless contract.mortgage_loan
    contract.build_condition unless contract.condition
    @contract.mortgage_loan.contracCurrency = @contract.currency
    @contract.mortgage_loan.term = @contract.term
    contract
  end
end
