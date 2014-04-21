class AddToContract < ActiveRecord::Migration
  def change
    add_column :contracts,:repay_amount,:float
    add_column :contracts,:open_item,:float
  end
end
