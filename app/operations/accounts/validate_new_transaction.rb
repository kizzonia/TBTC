module Accounts
  class ValidateNewTransaction
    def initialize(amount:, transaction_type:, account_id:, txhash:)
      @amount = amount.try(:to_f)
      @transaction_type = transaction_type
      @account_id = account_id
      @account = Account.where(id: @account_id).first
      @txhash = txhash

      @errors = []
  end
  def execute!
    validate_existence_of_account!
    if @transaction_type == "withdraw" and @account.present?
      validate_withdrawal!
      @errors
    end
  end

  private
  def validate_withdrawal!
    if @account.balance - @amount < 50.00
      @errors << "Not Enough Funds available For Withdrawal"
    end
  end


    def validate_existence_of_account!
      if @account.blank?
        @errors << "ACCOUNT NOT FOUND"
      end
    end
  end
end
