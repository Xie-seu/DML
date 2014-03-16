class AddColumnToBusinessPartner < ActiveRecord::Migration
  def change
    add_column :business_partners, :apply_id, :integer
  end
end
