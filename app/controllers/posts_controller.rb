class PostsController < ApplicationController
  include CommonActions
  
  after_action :update_iine, only: [:show]
  
  def new
    @post=Post.new
    @post.build_like
    @user=User.find_by(params[:id])
  end
  
  def create
      @post=Post.new(post_params)
      @post.save
      redirect_to user_posts_path
  end
  
  def index
    @user=User.find_by(params[:id])
    @posts=Post.where(user_id: @user.id).includes(:like)
  end
  
  def show
    @user=User.find_by(params[:id])
    @post=Post.find_by(params[:id])
    @like=@post.like
      respond_to do |format| 
      format.html # html形式でアクセスがあった場合は特に何もなし
      format.json { @update_like_count=@like.likes }# json形式でアクセスがあった場合は、@update_like_countに代入する
    end
    

  end
  
  def destroy
    @post=Post.find(params[:id])
    @post.destroy
  end
  
  private
  def post_params
    params.require(:post).permit(:description,:user_id, like_attributes:[:id,:post_id,:likes])
  end
  
end
