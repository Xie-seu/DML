class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :serialID
      t.integer :contractNumber
      t.integer :term
      t.string :usePath
      t.float :amount
      t.integer :currency
      t.integer :browser
      t.date :startDate
      t.date :endDate
      t.time :contractPeriod
      t.integer :repaymentType
      t.float :interest
      t.float :defaulInt
      t.string :credit
      t.integer :status

      t.timestamps
    end
  end
end
