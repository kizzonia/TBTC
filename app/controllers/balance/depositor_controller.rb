class Balance::DepositorController < ApplicationController
  def new
  @depositor = Depositor.new
  end

  def create
    @depositor = Depositor.new(params[:depositor])
    @depositor.request = request
    if @depositor.deliver
      flash.now[:error] = nil
    else
      flash.now[:error] = 'cannot send message.'
      render :new
    end
  end
end
