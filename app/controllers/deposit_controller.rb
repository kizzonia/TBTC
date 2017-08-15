class DepositController < ApplicationController
  def new
  @deposit = Deposit.new
  end

  def create
    @deposit = Deposit.new(params[:deposit])
    @deposit.request = request
    if @deposit.deliver
      flash.now[:error] = null
    else
      flash.now[:error] = 'cannot send message.'
      render :new
    end
  end
end
