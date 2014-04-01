class AddContractIdToCondition < ActiveRecord::Migration
  def change
    add_column :conditions, :contract_id, :integer
  end
end
