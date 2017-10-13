class ManagmentController < ApplicationController
  layout "managment"
  before_action :authenticate_managment!
  before_action :find_managment, only: [:show, :dashboard]


  def index
  end
  def dashboard
  end

  def show
  end

  private
  def find_management
    if params[:id].nil?
      @managment = current_managment
    else
      @managment = Managment.find(params[:id])
    end
  end

end
