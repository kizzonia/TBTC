class Transaction < ApplicationRecord
  belongs_to :account
  belongs_to :user
  TRANSACTION_TYPES = ["withdraw", "deposit"]
  validates :account, presence: true
  validates :amount, presence: true
  validates :transaction_type, presence: true, inclusion: { in: TRANSACTION_TYPES}
  validates :transaction_number, presence: true, uniqueness: true
  validates :txhash, presence: true,  uniqueness: true, if: -> {transaction_type == "deposit"}

  validates :completed_at, :inclusion => { :in => [true, false] }

  def comfirmed?
    !comfirmed_at.blank?
  end

  before_validation :load_defaults
  def load_defaults
    if self.new_record?
      self.transaction_number = SecureRandom.uuid
    end

  end



end
