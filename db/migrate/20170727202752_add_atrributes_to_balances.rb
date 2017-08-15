class AddAtrributesToBalances < ActiveRecord::Migration[5.0]
  def change
    add_column :balances, :tradeId, :string
    add_column :balances, :currency, :string
    add_column :balances, :deposit, :string
    add_column :balances, :expiration, :datetime
    add_column :balances, :status, :string
  end
end
