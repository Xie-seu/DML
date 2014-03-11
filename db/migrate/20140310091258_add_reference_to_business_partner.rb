class AddReferenceToBusinessPartner < ActiveRecord::Migration
  def change
    add_column :collaterals, :BusinessPartner_id, :integer
    add_column :communication_infos, :BusinessPartner_id, :integer
    add_column :indentify_infos, :BusinessPartner_id, :integer
    add_column :repayment_infos, :BusinessPartner_id, :integer
    add_index :collaterals, :BusinessPartner_id
    add_index :communication_infos, :BusinessPartner_id
    add_index :indentify_infos, :BusinessPartner_id
    add_index   :repayment_infos, :BusinessPartner_id

  end
end
