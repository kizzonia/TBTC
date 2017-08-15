class AddUserIdToBalances < ActiveRecord::Migration[5.0]
  def change
    add_column :balances, :user_id, :integer
  end
end
