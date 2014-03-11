class ChangeDatetypeOfCommunicationInfo < ActiveRecord::Migration
def change
  change_column :communication_infos, :mobile,:string
end
end
