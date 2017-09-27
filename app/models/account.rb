class Account < ApplicationRecord
  extend FriendlyId
  friendly_id :account_number, use: :slugged

  belongs_to :user
  has_many :transactions, dependent: :destroy

  validates :user, presence: true
  validates :balance, presence: true
  validates :bitcoin_address, presence: true, uniqueness: true
  before_validation :load_defaults

  def load_defaults
    if self.new_record?
      self.balance = 0.00
      self.account_number = SecureRandom.uuid
    end
  end

#  def auto_increment
  #  @accounts.each do |account|
  #   if account.balance > 0.00
  #    @divider = account.balance * 0.01
  #  end
  #   account.update_attribute(balance: account.balance + @divider)
  # end
  #end


end
