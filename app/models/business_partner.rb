class BusinessPartner < ActiveRecord::Base
  attr_accessible :name, :companyCode
  has_one :repayment_info
  has_one :communication_info
  has_one :indentify_info
  has_many :collaterals

  #还需要添加contract和Application 2014-03-10 16:55

  #添加资料验证
  validates_presence_of :name
  validates_presence_of :companyCode
  validates_numericality_of :companyCode, :only_integer => true , :greater_than => 1
end
