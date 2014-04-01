class BusinessPartnersController < ApplicationController
  def index
  @business_partners = BusinessPartner.all
  respond_to do |format|
    format.html # index.html.erb
    format.json { render json: @business_partners }
    end
  end

  def show
    @business_partner = BusinessPartner.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @business_partner }
    end
  end

  # GET /business_partners/new
  # GET /business_partners/new.json
  def new
    @business_partner = BusinessPartner.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @business_partner }
    end
  end

  # GET /business_partners/1/edit
  def edit
    @business_partner = BusinessPartner.find(params[:id])
  end

  # POST /business_partners
  # POST /business_partners.json
  def create
    @business_partner = BusinessPartner.new(params[:business_partner])
  #  @collateral = @business_partner.collaterals.create(params[:collateral])
    respond_to do |format|
      if @business_partner.save
        format.html { redirect_to @business_partner,
                                  notice: 'business_partner was successfully created.' }
        format.json { render json: @business_partner,
                             status: :created,
                             location: @business_partner }
      else
        format.html { render action: "new" }
        format.json { render json: @business_partner.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # PUT /business_partners/1
  # PUT /business_partners/1.json
  def update
    @business_partner = BusinessPartner.find(params[:id])
    respond_to do |format|
      if @business_partner.update_attributes(params[:business_partner])
        format.html { redirect_to @business_partner,
                                  notice: 'business_partner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @business_partner.errors,
                             status: :unprocessable_entity }
      end
    end
  end

  # DELETE /business_partners/1
  # DELETE /business_partners/1.json
  def destroy
    @business_partner = BusinessPartner.find(params[:id])
    @business_partner.destroy

    respond_to do |format|
      format.html { redirect_to business_partners_url }
      format.json { head :no_content }
    end
  end
end
