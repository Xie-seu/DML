class RenameCoulumnToCashFlow < ActiveRecord::Migration
  def change
    rename_column :cash_flows,:currency,:status
  end
end
