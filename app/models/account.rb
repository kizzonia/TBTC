class Account < ApplicationRecord
  belongs_to :user
  has_many :transactions

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



end
