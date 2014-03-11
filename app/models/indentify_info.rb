class IndentifyInfo < ActiveRecord::Base
   attr_accessible :legelForm, :indentify
  belongs_to :business_partner

end
