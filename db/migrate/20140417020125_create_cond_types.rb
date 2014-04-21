class CreateCondTypes < ActiveRecord::Migration
  def change
    create_table :cond_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
