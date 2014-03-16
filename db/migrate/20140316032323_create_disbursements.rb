class CreateDisbursements < ActiveRecord::Migration
  def change
    create_table :disbursements do |t|
      t.integer :flowType
      t.text :text
      t.integer :repaymentType
      t.integer :postingControl
      t.date :paymentDate
      t.float :currentPayment
      t.integer :nominalPayment
      t.decimal :disbursementRate
      t.float :disbursementInt
      t.float :grossPayAmount

      t.timestamps
    end
  end
end
