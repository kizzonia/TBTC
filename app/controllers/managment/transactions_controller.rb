class Managment::TransactionsController < ApplicationController
  layout "managment"
  before_action :find_transaction, only: [:comfirm,:show, :edit, :update, :destroy]
  before_action :authenticate_managment!
  def index
    @transactions = Transaction.all.order('created_at DESC')

  end

  def show
    @transaction = Transaction.find(params[:id])
  end


  def edit

  end

  def update
    if @transaction.update(transaction_params)
      redirect_to managment_transaction_path(@transaction)
    else
      render 'edit'
    end
  end
  def destroy
    if @transaction.destroy
      redirect_to managment_transactions_path, notice: "deleted"
    end
  end


  def comfirm
    @transaction.update_attribute(:comfirmed_at, Time.now)
    redirect_to managment_transactions_path, notice: "Transaction Confirmed"
  end




  private
  def find_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:transaction_number, :amount, :comfirmed_at, :transaction_type, :account_id)
  end
end
