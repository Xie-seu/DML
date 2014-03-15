class ContractBusinessPartnership < ActiveRecord::Base
  attr_accessible :business_partner_id, :contract_id
  belongs_to :business_partner
  belongs_to :contract
end
