class Disbursement < ActiveRecord::Base
  attr_accessible :currentPayment, :disbursementInt, :disbursementRate, :flowType, :grossPayAmount, :nominalPayment, :paymentDate, :postingControl, :repaymentType, :text
  validates_presence_of :currentPayment, :disbursementInt, :disbursementRate, :flowType, :grossPayAmount, :nominalPayment, :paymentDate, :postingControl, :repaymentType
  validates_numericality_of :currentPayment, :disbursementInt, :disbursementRate, :flowType, :grossPayAmount, :nominalPayment, :postingControl, :repaymentType
# todo: 自动还款标识。暂时没有解决方法。
  belongs_to :contract
end
