class CreateCommunicationInfos < ActiveRecord::Migration
  def change
    create_table :communication_infos do |t|
      t.string :address
      t.integer :mobile

      t.timestamps
    end
  end
end
