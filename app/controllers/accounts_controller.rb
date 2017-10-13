class AccountsController < ApplicationController
  before_action :find_account, only: [ :show, :edit, :update, :destroy]
  before_action :authenticate_user!
  def index
    @accounts = Account.where(user_id: current_user).order('created_at DESC')
  end

  def show
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
#  def destroy
#    @account.destroy
  #  respond_to do |format|
  #    format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
  #    format.json { head :no_content }
  #  end
#  end
  private
  def find_account
    @account = Account.friendly.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:account_number, :balance, :user_id, :bitcoin_address, :slug)
  end
end
