class Repayment < ActiveRecord::Base
  attr_accessible :cash_amount,
                  :comment,
                  :execute_time
  belongs_to :contract
end
