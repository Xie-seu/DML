class AddContractToRepayment < ActiveRecord::Migration
  def change
    change_column :repayments,:cash_amount,:float,:default => 0
    add_column :repayments,:contract_id,:integer
  end
end
