class Condition < ActiveRecord::Base
  #discountType == 1 ? "打折", "不打折"
  #disbursementRate = 1 (默认为1)
  #repaymentType
  #     1 本息一次付清
  #     2 按月付息，本金一次结清
  #     3 本息按月支付

  attr_accessible :commitCapital,
                  :disbursementRate,
                  :discountType,
                  :fixedFrom,
                  :fixedUntil,
                  :repaymentType,
                  :termEnd,
                  :termStart,
                  :contract_id
  belongs_to :contract
  #资料校验
  validates_presence_of :commitCapital,
                        :repaymentType,
                        :disbursementRate,
                        :discountType

  validates_numericality_of  :commitCapital,
                             :repaymentType,
                             :disbursementRate,
                             :discountType
  # TODO discountType需要创建
  validates_inclusion_of :discountType, :in => [0,1,2,3]



end
