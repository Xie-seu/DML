class CreateFlowTypes < ActiveRecord::Migration
  def change
    create_table :flow_types do |t|
      t.integer :flowNum
      t.string :flowName

      t.timestamps
    end
  end
end
