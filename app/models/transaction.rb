class Transaction < ApplicationRecord
  belongs_to :account
  TRANSACTION_TYPES = ["withdraw", "deposit"]
  validates :account, presence: true
  validates :amount, presence: true
  validates :transaction_type, presence: true, inclusion: { in: TRANSACTION_TYPES}
  validates :transaction_number, presence: true, uniqueness: true
#  validates :txhash, presence: true, uniqueness: true

  before_validation :load_defaults
#  before_validation :check
  def load_defaults
    if self.new_record?
      self.transaction_number = SecureRandom.uuid
    end

  end

#  def check
#    if self.transaction_type == "withdraw"
  #    self.txhash = SecureRandom.uuid
  #  end
#end


end
