class AddIndexToBusinessPartner < ActiveRecord::Migration
  def change
    rename_column :collaterals, :BusinessPartner_id, :business_partner_id
    rename_column :communication_infos, :BusinessPartner_id, :business_partner_id
    rename_column :indentify_infos, :BusinessPartner_id, :business_partner_id
    rename_column :repayment_infos, :BusinessPartner_id, :business_partner_id
    add_index :collaterals, :business_partner_id
    add_index :communication_infos, :business_partner_id
    add_index :indentify_infos, :business_partner_id
    add_index   :repayment_infos, :business_partner_id

  end
end
