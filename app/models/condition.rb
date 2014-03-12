class Condition < ActiveRecord::Base
  attr_accessible :commitCapital, :disbursementRate, :discountType, :fixedFrom, :fixedUntil, :repaymentType, :termEnd, :termStart
  belongs_to :mortgage_loan
  has_many :condition_items
  #资料校验
  validates_presence_of :commitCapital,:repaymentType,:disbursementRate, :discountType, :fixedFrom , :fixedUntil, :termStart, :termEnd
  validates_numericality_of  :commitCapital,:repaymentType,:disbursementRate, :discountType



end
