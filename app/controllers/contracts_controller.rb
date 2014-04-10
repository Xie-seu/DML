class ContractsController < ApplicationController
  #在合同管理上，有两个重要功能需要实现
  #1.合同状态的管理（创建，变更，放款，显示，合同本金减少，存档，重新激活）
  #2.现金流计算与显示
  # GET /contracts
  # GET /contracts.json
  def index
    @contracts = Contract.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contracts }
    end
  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    @contract = Contract.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contract }
    end
  end

  # GET /contracts/new
  # GET /contracts/new.json
  def new
    @contract = Contract.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contract }
    end


  end
  #GET /contracts/search
  #method search only use browser
  def search_by_browser
    @contracts = Contract.where(["browser like ?", "%#{params[:browser]}%"]).paginate(
        :page => params[:page]
    )
    render  :action => :index

  end
  def reduce
    @contract = Contract.find(params[:id])
    @contract.status = 6

render :action => :edit
  end
  def status_commit
    @contract = Contract.find(params[:id])
    @contract.status = 3
    @contract.save
    render :action => :edit
  end
  def withdraw
    @contract = Contract.find(params[:id])
    @contract.status = 8
    @contract.save
    render :action => :show
  end
  def approve
    @contract = Contract.find(params[:id])
    @contract.status = 4
    @contract.save
    render :action => :show
  end
  def reject
    @contract = Contract.find(params[:id])
    @contract.status = 2
    @contract.save
    render :action => :show
  end
  # GET /contracts/1/edit
  def edit
    @contract = Contract.find(params[:id])
   end

  # POST /contracts
  # POST /contracts.json
  def create
    @contract = Contract.new(params[:contract])
    respond_to do |format|
      if @contract.save
        format.html { redirect_to @contract, notice: 'Contract was successfully created.' }
        format.json { render json: @contract, status: :created, location: @contract }
      else
        format.html { render action: "new" }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contracts/1
  # PUT /contracts/1.json
  def update
    @contract = Contract.find(params[:id])
    respond_to do |format|
      if @contract.update_attributes(params[:contract])
        format.html { redirect_to @contract, notice: 'Contract was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract = Contract.find(params[:id])
    @contract.destroy

    respond_to do |format|
      format.html { redirect_to contracts_url }
      format.json { head :no_content }
    end
  end
end
