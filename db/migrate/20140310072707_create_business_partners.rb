class CreateBusinessPartners < ActiveRecord::Migration
  def change
    create_table :business_partners do |t|
      t.string :name
      t.integer :companyCode
      t.timestamps
      #repayment;communicationInfo;indentifyInfo;
    end
  end
end
