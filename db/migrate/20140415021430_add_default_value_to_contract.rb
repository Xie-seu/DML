class AddDefaultValueToContract < ActiveRecord::Migration
  def change
    change_column :contracts,:currency,:integer,:default => 1
    change_column :contracts,:repaymentType,:integer,:default => 1
    change_column :contracts,:defaulInt,:decimal,:scale => 4, :precision => 5
    change_column :conditions,:repaymentType,:integer,:default => 1
    change_column :conditions,:disbursementRate,:decimal,:scale => 4,:precision => 5
    change_column :conditions,:discountType,:integer,:default => 1
    change_column :condition_items,:repayPercent,:decimal,:scale => 5,:precision => 5
    change_column :condition_items,:currency,:integer,:default => 1
    add_column :condition_items,:creditSide,:boolean
  end
end
