class Collateral < ActiveRecord::Base
  attr_accessible :collateralType, :feather, :objectValue ,:business_partner_id , :business_partner
  belongs_to :business_partner
  #添加资料验证
  validates_presence_of :collateralType ,:feather, :objectValue, :business_partner_id
  validates_numericality_of :collateralType, :feather ,:objectValue

end
