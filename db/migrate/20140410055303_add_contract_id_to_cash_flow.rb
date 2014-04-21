class AddContractIdToCashFlow < ActiveRecord::Migration
  def change
    add_column :cash_flows,:contract_id,:integer
    add_column :cash_flows,:PCname,:string
  end
end
