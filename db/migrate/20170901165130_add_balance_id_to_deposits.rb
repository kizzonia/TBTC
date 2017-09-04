class AddBalanceIdToDeposits < ActiveRecord::Migration[5.0]
  def change
    add_column :deposits, :balance_id, :integer
  end
end
