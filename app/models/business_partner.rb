class BusinessPartner < ActiveRecord::Base
  attr_accessible :name, :companyCode
  has_one :repayment_info
  has_one :communication_info
  has_one :indentify_info
  has_many :collaterals
  has_many :contract_business_partnerships
  has_many :contracts, :through => :contract_business_partnerships
  #还需要添加contract和Application 2014-03-10 16:55

  #添加资料验证
  validates_presence_of :name
  validates_presence_of :companyCode
  validates_numericality_of :companyCode, :only_integer => true ,:equal_to => 1#companyCode的含义是为集团用户的接口，这里稍作简化。只认为有一家主公司
end
