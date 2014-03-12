class CommunicationInfo < ActiveRecord::Base
    attr_accessible :address, :mobile,:business_partner_id , :business_partner
    belongs_to :business_partner
    #添加资料验证
    validates_presence_of :address, :mobile, :business_partner_id
    validates_length_of :mobile, :is => 11 #电话号码都是11位

    validates_uniqueness_of :mobile,:message => "Your mobile number already exist" ,:on => :create #只在创建和修改时验证

  end
