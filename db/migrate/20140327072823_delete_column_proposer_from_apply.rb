class DeleteColumnProposerFromApply < ActiveRecord::Migration
  def up
    remove_column :applies, :proposer
  end
  def down

  end
end
