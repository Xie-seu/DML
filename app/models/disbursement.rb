class Disbursement < ActiveRecord::Base
  attr_accessible :currentPayment, :disbursementInt, :disbursementRate, :flowType, :grossPayAmount, :nominalPayment, :paymentDate, :postingControl, :repaymentType, :text
  has_many :cash_flows
  accepts_nested_attributes_for :cash_flows,
                                :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  validates_presence_of :currentPayment, :disbursementInt, :disbursementRate, :flowType, :grossPayAmount, :nominalPayment, :paymentDate, :postingControl, :repaymentType
  validates_numericality_of :currentPayment, :disbursementInt, :disbursementRate, :flowType, :grossPayAmount, :nominalPayment, :postingControl, :repaymentType
  
end
