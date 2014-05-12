
class CashFlow < ActiveRecord::Base
  attr_accessible :amount,
                  :basisAmount,
                  :calcuDate,
                  :flowName,
                  :flowType,
                  :status,
                  :PC,
                  :dayNum,
                  :dueDate,
                  :PCname,
                  :caluFrom,
                  :caluUntil,
                  :cashAmount,
                  :centage,
                  :creditSide,
                  :contract_id
  belongs_to :contract
  validates_presence_of :amount,
                        :calcuDate,
                        :flowType,
                        :flowName,
                        :status
  validates_inclusion_of :status, :in => [0,1]

end