class Disbursement < ActiveRecord::Base
  attr_accessible :currentPayment, :disbursementInt, :disbursementRate, :flowType, :grossPayAmount, :nominalPayment, :paymentDate, :postingControl, :repaymentType, :text
  has_many :cash_flows
  validates_presence_of :currentPayment, :disbursementInt, :disbursementRate, :flowType, :grossPayAmount, :nominalPayment, :paymentDate, :postingControl, :repaymentType
  validates_numericality_of :currentPayment, :disbursementInt, :disbursementRate, :flowType, :grossPayAmount, :nominalPayment, :postingControl, :repaymentType
end
