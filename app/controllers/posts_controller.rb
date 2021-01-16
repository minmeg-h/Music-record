class PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
      flash[:notice] = '投稿が保存されました'
    else
      redirect_to new_post_path
      flash[:alert] = '投稿に失敗しました'
    end
  end

  def index
     @posts = Post.all.includes(:user).order('created_at DESC')
  end

  private

  def post_params
    params.require(:post).permit(:text, :image).merge(user_id: current_user.id)
  end
end
