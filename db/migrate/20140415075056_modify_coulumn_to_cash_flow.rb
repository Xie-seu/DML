class ModifyCoulumnToCashFlow < ActiveRecord::Migration
  def change
    remove_column :condition_items,:creditSide
    add_column :cash_flows,:creditSide,:boolean
  end
end
