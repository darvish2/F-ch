class PostController < ApplicationController

def index
end


def show
  @topic = Topic.find(params[:id])
  @posts = Post.where(topic_id: params[:id])
  @search = Post.ransack(params[:q])
　@posts = @search.result
end



  def create
    @post = Post.new(params[:post].permit(:topic_id, :name, :body))
    @post.save
    redirect_to root_path
  end

end
