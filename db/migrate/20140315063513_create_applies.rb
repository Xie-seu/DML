class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.integer :proposer
      t.integer :loanType
      t.integer :term
      t.string :usePath
      t.float :amount
      t.integer :currency
      t.date :startDate
      t.date :endDate
      t.integer :repaymentType
      t.string :processor
      t.integer :business_partner_id
      t.timestamps
    end
  end
end
