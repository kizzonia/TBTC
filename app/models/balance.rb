class Balance < ApplicationRecord
      belongs_to :user
      has_many :deposits

def self.amount(balance)
      @balance.balance += @deposit.amount
  end
end
