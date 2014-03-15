class Contract < ActiveRecord::Base
  #amount = 贷款金额
  #browser = businessPartner_id
  #contractNumber = id
  attr_accessible :amount, :browser, :contractNumber, :contractPeriod, :credit, :currency, :defaulInt, :endDate, :interest, :repaymentType, :serialID, :startDate, :status, :term, :usePath
  has_many :contract_business_partnerships
  has_many :business_partners , :through => :contract_business_partnerships
  has_one :mortgage_loan

  validates_numericality_of :amount, :browser, :contractNumber, :currency, :defaulInt, :interest, :repaymentType, :status, :term


end
