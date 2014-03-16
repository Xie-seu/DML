class RenameColumnOfBp < ActiveRecord::Migration
  def up
  rename_column :applies,:business_partner_id, :business_partners_id

  end

  def down
  end
end
