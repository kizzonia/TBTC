class AccountsController < ApplicationController
  before_action :find_account, only: [ :show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @accounts = Account.where(user_id: current_user).order('created_at DESC')
  end

  def show
    @account = Account.friendly.find(params[:id])
  end

  def new
    @account = current_user.accounts.build
  end

  def create
    @account = current_user.accounts.build(account_params)
    if @account.save
      user = User.find_by_id(@account.user_id)
      account = @account
      AccountMailer.account_email(user, account).deliver
      redirect_to @account, notice: "Account Successfully Created"
    else
      render 'new'
    end
  end
  def edit

  end

  def update
    if @account.update(account_params)

            redirect_to @account
          else
            render 'edit'
          end
  end

  private
  def find_account
    @account = Account.friendly.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:account_number, :balance, :bitcoin_address)
  end
end
