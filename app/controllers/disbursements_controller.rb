class DisbursementsController < ApplicationController
  # 功能，自动扣款标识（目前没有实现方案）.
  # GET /disbursements
  # GET /disbursements.json#BusinessPartner
  def index
    @disbursements = Disbursement.all
  end

  # GET /disbursements/1
  # GET /disbursements/1.json
  def show
    @disbursement = Disbursement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @disbursement }
    end
  end

  # GET /disbursements/new
  # GET /disbursements/new.json

def new
  @disbursement
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
  @disbursement.disbursementRate = 1#支付比率默认为1
  @disbursement.disbursementInt = 0#支付利率默认为0
end


  # POST /disbursements
  # POST /disbursements.json
  def create
    @disbursement = Disbursement.new(params[:disbursement])

    respond_to do |format|
      if @disbursement.save
        format.html { redirect_to @disbursement, notice: 'Disbursement was successfully created.' }
        format.json { render json: @disbursement, status: :created, location: @disbursement }
      else
        format.html { render action: "new" }
        format.json { render json: @disbursement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /disbursements/1
  # PUT /disbursements/1.json
  def update
    @disbursement = Disbursement.find(params[:id])

    respond_to do |format|
      if @disbursement.update_attributes(params[:disbursement])
        format.html { redirect_to @disbursement, notice: 'Disbursement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @disbursement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disbursements/1
  # DELETE /disbursements/1.json
  def destroy
    @disbursement = Disbursement.find(params[:id])
    @disbursement.destroy

    respond_to do |format|
      format.html { redirect_to disbursements_url }
      format.json { head :no_content }
    end
  end
  def find_contract
    @contract = Contract.find(params[:contract_id])
  end
  end
