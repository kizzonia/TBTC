class AddTransactionHashToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :txhash, :string
  end
end
