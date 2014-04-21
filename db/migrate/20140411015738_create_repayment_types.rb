class CreateRepaymentTypes < ActiveRecord::Migration
  def change
    create_table :repayment_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
