class Apply < ActiveRecord::Base
  attr_accessible :amount, :currency, :endDate, :loanType, :processor,  :repaymentType, :startDate, :term, :usePath, :business_partner_id
  belongs_to :business_partner, :foreign_key => "business_partner_id"
  validates_numericality_of :amount, :currency, :loanType, :processor,  :repaymentType, :term
  validates_presence_of :amount, :currency, :endDate, :loanType, :processor, :repaymentType, :startDate, :term

  def close?
    self.status == "CLOSED"
  end
end
