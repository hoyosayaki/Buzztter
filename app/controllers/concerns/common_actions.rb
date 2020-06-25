module CommonActions
 #以下extendは必須
  extend ActiveSupport::Concern    
      # 登録後にいいねの数をランダムで更新していく。
    
def update_iine
    @post=Post.find(params[:id])
    @like=@post.like
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
    # sleep(5)  
    end
    
end
end