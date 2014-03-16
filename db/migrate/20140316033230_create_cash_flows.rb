class CreateCashFlows < ActiveRecord::Migration
  def change
    create_table :cash_flows do |t|
      t.integer :flowType
      t.integer :currency
      t.float :amount
      t.references :disbursements ,:index => true
      t.timestamps
    end
  end
end
