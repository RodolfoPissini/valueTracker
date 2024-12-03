class CreateBalances < ActiveRecord::Migration[7.1]
  def change
    create_table :balances do |t|
      t.decimal :initial_value
      t.decimal :remaining_value

      t.timestamps
    end
  end
end
