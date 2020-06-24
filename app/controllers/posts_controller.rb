class PostsController < ApplicationController
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
      # respond_to do |format| 
      # format.html # html形式でアクセスがあった場合は特に何もなし
      # format.json { @update_like_count=@like.like }# json形式でアクセスがあった場合は、@update_like_countに代入する
    # end
      # 登録後にいいねの数をランダムで更新していく。
    
    
    update_times=rand(1..5) # 何回更新するかをランダムで取得する。（10回から100回くらい？）（5回だとする。）
    
    update_times.times do
    
    # 1回目
    
    # 現在のいいねの数を取得する。
    
    
    
    add_iine=rand(1..1000) # 何いいねを足すか、ランダムで決める。（1から100くらい？）
    
    # 現在のいいね＋取得したいいねでDBの値を更新する。
    @post=Post.find(params[:id])
    @like=@post.like
    @like.update( likes: add_iine+@like.likes )
    
    # 次回まで何秒あけるかランダムで決める。（5秒から30くらい？）
    sleep(5)  
    end
    # end
  
    
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
