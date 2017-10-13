class WelcomeController < ApplicationController
  def new
    @welcome = Welcome.new
  end

    def create
      @welcome = Welcome.new(params[:welcome])
      @welcome.request = request
      if @welcome.deliver
        flash.now[:error] = nil
      else
        flash.now[:error] = 'cannot send message.'
        render :new
      end
    end
end
