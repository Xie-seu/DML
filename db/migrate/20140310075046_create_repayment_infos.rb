class CreateRepaymentInfos < ActiveRecord::Migration
  def change
    create_table :repayment_infos do |t|
      t.integer :bankID
      t.integer :bankAcct
      t.boolean :collection
      t.timestamps
    end
  end
end
