class Apply < ActiveRecord::Base
  attr_accessible :amount, :currency, :endDate, :loanType, :processor, :proposer, :repaymentType, :startDate, :term, :usePath
  belongs_to :business_partner, :foreign_key => "business_partner_id"
  validates_numericality_of :amount, :currency, :loanType, :processor, :proposer, :repaymentType, :term
  validates_presence_of :amount, :currency, :endDate, :loanType, :processor, :proposer, :repaymentType, :startDate, :term
end
