class AddContractToDisburements < ActiveRecord::Migration
  def change
    add_column :disbursements, :contract_id, :integer
  end
end
