class AddReferenceToMortgageLoan < ActiveRecord::Migration
  def change
    #为MortgageLoan和contract之间建立外键
    add_column :mortgage_loans, :contract_id, :integer
  end
end
