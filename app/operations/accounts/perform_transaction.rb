module Accounts
  class PerformTransaction
    def initialize(amount:, transaction_type:, account_id:)
      @amount = amount.try(:to_f)
      @transaction_type = transaction_type
      @account_id = account_id
     # @transaction = transaction
      @account = Account.where(id: @account_id).first
  end
  def execute!
    Transaction.create!(
      amount: @amount,
      transaction_type: @transaction_type,
      account: @account
     )
    if @transaction_type == "withdraw"
      @account.update!(balance: @account.balance - @amount)
    elsif @transaction_type == "deposit"
      @account.update!(balance: @account.balance + @amount)

    end
    @account
  end
  end
end
