class CreateRepayments < ActiveRecord::Migration
  def change
    create_table :repayments do |t|
      t.float :cash_amount, :default => 0
      t.date :execute_time, :default => Time.now
      t.string :comment

      t.timestamps
    end
  end
end
