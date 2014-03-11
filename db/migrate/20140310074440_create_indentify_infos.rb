class CreateIndentifyInfos < ActiveRecord::Migration
  def change
    create_table :indentify_infos do |t|
      t.string  :indentify
      t.integer :legelForm #01-Corparation;02-Person;03-Group
      t.timestamps
    end
  end
end
