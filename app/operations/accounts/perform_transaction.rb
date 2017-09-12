module Accounts
  class PerformTransaction
    def initialize(amount:, transaction_type:, account_id:, txhash:)
      @amount = amount.try(:to_f)
      @transaction_type = transaction_type
      @account_id = account_id
      @txhash = txhash
     # @transaction = transaction
      @account = Account.where(id: @account_id).first
  end
  def execute!
    Transaction.create!(
      amount: @amount,
      transaction_type: @transaction_type,
      account: @account,
      txhash: @txhash

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
