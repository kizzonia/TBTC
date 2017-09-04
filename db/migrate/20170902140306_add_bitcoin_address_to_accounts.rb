class AddBitcoinAddressToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :bitcoin_address, :string
  end
end
