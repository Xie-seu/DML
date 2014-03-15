class CreateContractBusinessPartnerships < ActiveRecord::Migration
  def change
    create_table :contract_business_partnerships do |t|
      t.integer :contract_id
      t.integer :business_partner_id

      t.timestamps
    end
  end
end
