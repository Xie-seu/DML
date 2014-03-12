class CreateConditionItems < ActiveRecord::Migration
  def change
    create_table :condition_items do |t|
      t.integer :condType
      t.date :effFrom
      t.decimal :repayPercent
      t.float :comditionAmount
      t.integer :currency
      t.integer :IS
      t.integer :PF
      t.integer :Frg
      t.integer :dueOn
      t.integer :ED
      t.date :calcDate
      t.integer :MC
      t.string :description
      t.references :condition , :index => true
      t.timestamps
    end
  end
end
