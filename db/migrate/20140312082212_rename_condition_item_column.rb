class RenameConditionItemColumn < ActiveRecord::Migration
  def up
    rename_column :condition_items, :conditionItem, :conditionAmount
  end

  def down
  end
end
