class CashFlow < ActiveRecord::Base
  attr_accessible :amount, :currency, :flowType, :disbursement
  belongs_to :disbursement
  validates_presence_of :amount, :currency, :flowType, :disbursement_id
end
