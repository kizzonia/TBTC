class Managment::KbsController < ApplicationController
  layout "managment"
  before_action :find_kbs, only: [ :show, :edit, :update, :destroy]
  before_action :authenticate_managment!
  def index
    @kbs = Kb.all.order('created_at DESC')
  end

  def show

  end
  def new
    @kb = current_managment.kbs.build
  end

  def create
    @kb = current_managment.kbs.build(kbs_params)
    if @kb.save
      redirect_to managment_kbs_path(@kb), notice: "knowlegdes Successfully Created"
    else
      render 'new'
    end
  end
  def edit
  end

  def update
    if @kb.update(kbs_params)
      redirect_to managment_kbs_path(@kb)
    else
      render 'edit'
    end
  end

  def destroy
    if @kb.destroy
      redirect_to managment_kbs_path
    end
  end

  private
  def find_kbs
    @kb = Kb.friendly.find(params[:id])
  end

  private

    def kbs_params
      params.require(:kb).permit(:title, :body, :question, :managment_id, :slug)
    end


end
