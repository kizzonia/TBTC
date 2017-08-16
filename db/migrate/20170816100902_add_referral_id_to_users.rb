class AddReferralIdToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :referral_id, :string
  end
end
