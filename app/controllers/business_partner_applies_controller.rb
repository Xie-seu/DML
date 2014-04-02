class BusinessPartnerAppliesController < ApplicationController
  before_filter :find_bp

  def new
    @apply = @business_partner.applies.build
  end

  def index
    @applies = Apply.find_all_by_business_partner_id(@business_partner.id)
  end
  def create
    @apply = @business_partner.applies.build( params[:apply] )
    if @apply.save
      redirect_to business_partner_applies_path( @business_partner )
    else
      render :action => :new
    end
  end

  def edit
    @apply = @business_partner.applies.find[params[:apply]]
  end

  def update
    @apply = @business_partner.apply

    if @apply.update_attributes( params[:apply] )
      redirect_to business_partner_applies_path( @business_partner )
    else
      render :action => :new
    end

  end

  def destroy
    @apply = @business_partner.apply
    @apply.destroy

    redirect_to business_partner_applies_path( @business_partner )
  end
  protected
  def find_bp
    @business_partner = BusinessPartner.find(params[:business_partner_id])
  end
end
