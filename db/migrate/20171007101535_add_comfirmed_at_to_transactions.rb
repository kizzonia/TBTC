class AddComfirmedAtToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :comfirmed_at, :datetime
  end
end
