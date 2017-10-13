class KbsController < ApplicationController
  layout "blog"
  before_action :find_kbs, only: [ :show, :edit, :update, :destroy]
  before_action :authenticate_managment!, except: [:index, :show]
  def index
    @kbs = Kb.all.order('created_at DESC')
  end

  def show
    @kbs = Kb.all.order('created_at DESC')
  end

  private
  def find_kbs
    @kb = Kb.friendly.find(params[:id])
  end

  private
    def kbs_params
      params.require(:kb).permit(:title, :body, :questio, :managment_id, :slug)
    end
end
