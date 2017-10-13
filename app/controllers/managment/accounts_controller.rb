class Managment::AccountsController < ApplicationController
  layout "managment"
  before_action :find_account, only: [ :show, :edit, :update, :destroy]
  before_action :authenticate_managment!
  def index
    @accounts = Account.all.order('created_at DESC')
  end

  def show
  end


  def edit

  end

  def update
    if @account.update(account_params)
      redirect_to managment_account_path(@account), notice: "Updated"
    else
      render 'edit'
    end
  end

  def destroy
    @account.destroy
    respond_to do |format|
      format.html { redirect_to managment_accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def find_account
    @account = Account.friendly.find(params[:id])
  end

  def account_params
    params.require(:account).permit(:account_number, :balance, :bitcoin_address, :user_id, :slug)
  end
end
