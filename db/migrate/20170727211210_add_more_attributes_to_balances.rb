class AddMoreAttributesToBalances < ActiveRecord::Migration[5.0]
  def change
    add_column :balances, :tradetype, :string
    add_column :balances, :entry, :string
    add_column :balances, :rate, :string
    add_column :balances, :return, :string
  end
end
