class CreateBusinessProcessRecords < ActiveRecord::Migration
  def change
    create_table :business_process_records do |t|
      t.integer :serialNum
      t.integer :operationType
      t.string :processor
      t.string :keyWord

      t.timestamps
    end
  end
end
