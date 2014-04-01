class BusinessPartner < ActiveRecord::Base
  attr_accessible :name, :companyCode, :apply_id, :repayment_info_attributes, :collaterals_attributes, :communication_info_attributes, :indentify_info_attributes
  has_one :repayment_info, :dependent =>  :destroy
  has_one :communication_info , :dependent =>  :destroy
  has_one :indentify_info, :dependent =>  :destroy
  has_many :collaterals, :dependent =>  :destroy
  has_many :contract_business_partnerships, :dependent =>  :destroy
  has_many :contracts, :through => :contract_business_partnerships
  has_many :applies
  accepts_nested_attributes_for :repayment_info, :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  accepts_nested_attributes_for :indentify_info, :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  accepts_nested_attributes_for :communication_info, :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  accepts_nested_attributes_for :collaterals, :allow_destroy => :true,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  #添加资料验证
  validates_presence_of :name
  validates_presence_of :companyCode
  validates_numericality_of :companyCode, :only_integer => true ,:equal_to => 1#companyCode的含义是为集团用户的接口，这里稍作简化。只认为有一家主公司
end
