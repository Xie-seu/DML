class CreateConditions < ActiveRecord::Migration
  def change
    create_table :conditions do |t|
      t.integer :commitCapital
      t.integer :repaymentType
      t.decimal :disbursementRate
      t.integer :discountType
      t.date :fixedForm
      t.date :fixedUntil
      t.date :termStart
      t.date :termEnd
      t.references :mortgage_loan , :index => true
      t.timestamps
    end
  end
end
