class CreatePcs < ActiveRecord::Migration
  def change
    create_table :pcs do |t|
      t.string :name

      t.timestamps
    end
  end
end
