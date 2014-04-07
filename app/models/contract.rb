class Contract < ActiveRecord::Base
  #amount = 贷款金额
  #browser = businessPartner_id
  #contractNumber = id
  before_validation :setup_default
  attr_accessible :amount, :browser, :contractNumber, :contractPeriod, :credit, :currency, :defaulInt, :endDate, :interest, :repaymentType, :serialID, :startDate, :status, :term, :usePath
  has_many :contract_business_partnerships, :dependent =>  :destroy
  has_many :business_partners , :through => :contract_business_partnerships
  has_one :mortgage_loan, :dependent =>  :destroy
  has_one :condition, :dependent =>  :destroy
  has_many :disbursements
  validates_numericality_of :amount, :browser, :contractNumber, :currency, :defaulInt, :interest, :repaymentType, :status, :term, :message => 'must been filled & must be numerical '

#合同的八种状态
  validates_inclusion_of :status, :in => [1,2,3,4,5,6,7,8]

  accepts_nested_attributes_for :mortgage_loan
  validates_associated :condition
  accepts_nested_attributes_for :condition ,
                                :reject_if => :all_blank,
                                :allow_destroy => true
  scope :recent_three_days, where(["created_at > ? ", Time.now - 3.days ])
  def self.recent(t=Time.now)
    where(["created_at > ? ", t ])
  end

  protected
  def setup_default
    self.serialID = self.id
    self.contractNumber = self.id.to_i * 10000 + self.browser.to_i
  end
end
