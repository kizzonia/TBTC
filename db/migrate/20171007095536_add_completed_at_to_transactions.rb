class AddCompletedAtToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_column :transactions, :completed_at, :boolean
  end
end
