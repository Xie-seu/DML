class Condition < ActiveRecord::Base
  attr_accessible :commitCapital, :disbursementRate, :discountType, :fixedFrom, :fixedUntil, :repaymentType, :termEnd, :termStart, :contract
  belongs_to :contract
  has_many :condition_items,:dependent => :destroy
  #资料校验
  validates_presence_of :commitCapital,:repaymentType,:disbursementRate, :discountType, :fixedFrom , :fixedUntil, :termStart, :termEnd
  validates_numericality_of  :commitCapital,:repaymentType,:disbursementRate, :discountType



end
