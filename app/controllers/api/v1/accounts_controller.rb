module Api
  module V1
    class AccountsController < ApplicationController
      def new_transaction
        amount            = params[:amount]
        transaction_type  = params[:transaction_type]
        account_id        = params[:account_id]
        txhash            = params[:txhash]

        errors = ::Accounts::ValidateNewTransaction.new(
                    amount: amount,
                    transaction_type: transaction_type,
                    account_id: account_id,
                    txhash:     txhash
                    ).execute!

        if errors.size > 0
          render json: {errors: errors}, status: 402
        else
          account = ::Accounts::PerformTransaction.new(
                      amount: amount,
                      transaction_type: transaction_type,
                      txhash:     txhash,
                      account_id: account_id,
                    ).execute!
          render json: { balance: account.balance}
        end
      end
    end
  end
end
