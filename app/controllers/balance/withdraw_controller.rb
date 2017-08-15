class Balance::WithdrawController < ApplicationController
  def new
  @withdraw = Withdraw.new
  end

  def create

    @withdraw = Withdraw.new(params[:withdraw])
    @withdraw.request = request
    if @withdraw.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = 'cannot send message.'
      render :new
    end
  end
end
