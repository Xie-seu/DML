class RenameConditionIdToConditionItem < ActiveRecord::Migration
    def change
      rename_column :condition_items,:condition_id,:contract_id
    end
end
