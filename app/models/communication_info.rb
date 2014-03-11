class CommunicationInfo < ActiveRecord::Base
  attr_accessible :address, :mobile
  belongs_to :business_partner

end
