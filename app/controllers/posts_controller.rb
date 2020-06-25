class PostsController < ApplicationController
  include CommonActions
  
  after_action :update_iine, only: [:show]
  
  def new
    @post=Post.new
    @post.build_like
  end
  
  def create
    # if params[:submit]
      @post=Post.new(post_params)
      @post.save
      redirect_to posts_path
  end
  
  def index
    @posts=Post.all.includes(:like)
  end
  
  def show
    @post=Post.find(params[:id])
    @like=@post.like
      respond_to do |format| 
      format.html # html形式でアクセスがあった場合は特に何もなし
      format.json { @update_like_count=@like.likes }# json形式でアクセスがあった場合は、@update_like_countに代入する
      # format.json { @update_like_count={ ls: @like.likes} }# json形式でアクセスがあった場合は、@update_like_countに代入する
    end
    

  end
  
  def destroy
    @post=Post.find(params[:id])
    @post.destroy
  end
  
  private
  def post_params
    params.require(:post).permit(:description, like_attributes:[:id,:post_id,:likes])
  end
  
end
