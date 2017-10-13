class Managment::BlogsController < ApplicationController
  layout "managment"
  before_action :find_blogs, only: [ :show, :edit, :update, :destroy]
  before_action :authenticate_managment!
  def index
    @blogs = Blog.all.order('created_at DESC')
  end

  def show

  end
  def new
    @blog = current_managment.blogs.build
  end

  def create
    @blog = current_managment.blogs.build(blogs_params)
    if @blog.save
      redirect_to managment_blogs_path(@blog), notice: "Blog Successfully Created"
    else
      render 'new'
    end
  end
  def edit
  end

  def update
    if @blog.update(blogs_params)
      redirect_to managment_blogs_path(@blog)
    else
      render 'edit'
    end
  end

  def destroy
    if @blog.destroy
      redirect_to managment_blogs_path
    end
  end

  private
  def find_blogs
    @blog = Blog.friendly.find(params[:id])
  end

  private

    def blogs_params
      params.require(:blog).permit(:title, :body, :description, :managment_id, :slug)
    end


end
