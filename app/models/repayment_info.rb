class RepaymentInfo < ActiveRecord::Base
   attr_accessible :bankID, :bankAcct, :collection?

  belongs_to :business_partner
end
