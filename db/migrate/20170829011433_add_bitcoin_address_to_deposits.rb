class AddBitcoinAddressToDeposits < ActiveRecord::Migration[5.0]
  def change
    add_column :deposits, :bitcoin_address, :string
  end
end
