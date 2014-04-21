class SetdefaulValue < ActiveRecord::Migration
  def change
    change_column :contracts,:defaulInt,:decimal,:default => 5.5
    change_column :contracts,:interest,:decimal,:default => 5.5
    change_column :mortgage_loans,:loanType,:integer,:default => 1
    change_column :mortgage_loans,:loanClass,:integer,:default => 0
    change_column :mortgage_loans,:IPDcontrol,:integer,:default => 1
    change_column :mortgage_loans,:disAcc,:integer,:default => 1
    change_column :mortgage_loans,:FinProj,:integer,:default => 0

  end
end
