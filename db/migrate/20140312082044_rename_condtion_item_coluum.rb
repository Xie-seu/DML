class RenameCondtionItemColuum < ActiveRecord::Migration
  def up
    rename_column :condition_items, :comditionAmount, :conditionItem

  end

  def down
  end
end
