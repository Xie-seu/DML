class AddColumnToCashFlow < ActiveRecord::Migration
  def change
    add_column :cash_flows,:calcuDate,:date
    add_column :cash_flows,:flowName,:string
    add_column :cash_flows,:cashAmount, :float
    add_column :cash_flows,:PC,:integer
    add_column :cash_flows,:basisAmount,:float
    add_column :cash_flows,:centage,:decimal
    add_column :cash_flows,:caluFrom,:date
    add_column :cash_flows,:caluUntil,:date
    add_column :cash_flows,:dayNum,:integer, :default => 30
    add_column :cash_flows,:dueDate,:date

  end
end
