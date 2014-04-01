class ContractMortgageLoansController < ApplicationController
  before_filter :find_contract
  def show
    @mortgage_loan = @contract.mortgage_loan
  end
  def new
    @mortgage_loan = @contract.build_mortgage_loan
  end
  def create
    @mortgage_loan = @contract.build_mortgage_loan(params[:mortgage_loan])
    if @mortgage_loan.save
      redirect_to contract_mortgage_loan_url(@contract)
    else
      render :action => :new
    end
  end
  def edit
    @mortgage_loan = @contract.mortgage_loan
  end
  def update
    @mortgage_loan = @contract.mortgage_loan

    if @mortgage_loan.update_attributes(params[:mortgage_loan])
      redirect_to contract_mortgage_loan_url(@contract)
    else
      render :action =>  :new
    end
  end
  def destroy
    @mortgage_loan = @contract.mortgage_loan
    @mortgage_loan.destroy

    redirect_to contract_mortgage_loan_url(@contract)
  end
  def find_contract
    @contract = Contract.find(params[:contract_id])
  end
end
