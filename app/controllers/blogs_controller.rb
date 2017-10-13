class BlogsController < InheritedResources::Base

  layout "blog"
  before_action :find_blogs, only: [ :show, :edit, :update, :destroy]
  before_action :authenticate_managment!, except: [:index, :show]
  def index
    @blogs = Blog.all.order('created_at DESC')
  end

  def show
  end

  private
  def find_blogs
    @blog = Blog.friendly.find(params[:id])
  end
    def blog_params
      params.require(:blog).permit(:title, :description, :body, :managment_id, :slug)
    end
end
