class CreateCollaterals < ActiveRecord::Migration
  def change
    create_table :collaterals do |t|
      t.integer :collateralType
      t.integer :feather
      t.float   :objectValue
      t.timestamps
    end
  end
end
