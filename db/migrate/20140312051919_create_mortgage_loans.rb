class CreateMortgageLoans < ActiveRecord::Migration
  def change
    create_table :mortgage_loans do |t|
      t.integer :loanType
      t.integer :loanClass
      t.integer :IPDcontrol
      t.integer :disAcc
      t.integer :FinProj
      t.integer :interestCal
      t.integer :contracCurrency
      t.integer :term

      t.timestamps
    end
  end
end
