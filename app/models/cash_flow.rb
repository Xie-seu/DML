class CashFlow < ActiveRecord::Base
  attr_accessible :amount,
                  :basisAmount,
                  :calcuDate,
                  :flowName,
                  :flowType,
                  :currency,
                  :PC,
                  :dayNum,
                  :dueDate

  belongs_to :contract

end