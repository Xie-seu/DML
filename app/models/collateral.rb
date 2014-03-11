class Collateral < ActiveRecord::Base
   attr_accessible :collateralType, :feather, :objectValue
belongs_to :business_partner

end
