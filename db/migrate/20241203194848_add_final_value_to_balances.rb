class AddFinalValueToBalances < ActiveRecord::Migration[7.1]
  def change
    add_column :balances, :final_value, :decimal
  end
end
