class AddReferralToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :referralid, :string
  end
end
