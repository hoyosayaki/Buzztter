class PostsController < ApplicationController
  def new
    @post=Post.new
  end
  
  def create
    # if params[:submit]
      @post=Post.new(post_params)
      @post.save
      redirect_to posts_path
    # end
  end
  
  def index
    @posts=Post.all.includes(:likes)
  end
  
  def show
    @post=Post.find(params[:id])
  end
  
  def destroy
    @post=Post.find(params[:id])
    @post.destroy
  end
  
  private
  def post_params
    params.require(:post).permit(:description)
  end
  
end
