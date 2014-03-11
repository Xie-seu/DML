class BusinessPartner < ActiveRecord::Base
  attr_accessible :name, :companyCode
  has_one :repayment_info
  has_one :communication_info
  has_one :indentify_info
  has_many :collaterals

 #还需要添加contract和Application 2014-03-10 16:55
end
