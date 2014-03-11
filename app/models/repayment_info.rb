class RepaymentInfo < ActiveRecord::Base
   attr_accessible :bankID, :bankAcct, :collection,:business_partner_id , :business_partner
  belongs_to :business_partner
  #设置资料验证
  validates_presence_of :bankID, :bankAcct, :collection
  validates_numericality_of :bankID, :bankAcct
end
