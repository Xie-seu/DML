class IndentifyInfo < ActiveRecord::Base
   attr_accessible :legelForm, :indentify,:business_partner_id , :business_partner
  belongs_to :business_partner
  #添加资料验证
    validates_presence_of :legelForm, :indentify
    validates_inclusion_of :legelForm, :in => [1,2,3]

end
