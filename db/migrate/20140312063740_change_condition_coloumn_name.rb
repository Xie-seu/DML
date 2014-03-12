class ChangeConditionColoumnName < ActiveRecord::Migration
  def up
    rename_column :conditions, :fixedForm,:fixedFrom
  end

  def down
  end
end
