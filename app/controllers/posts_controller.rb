class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
      flash[:notice] = '投稿が保存されました'
    else
      redirect_to new_post_path
      flash[:alert] = '投稿に失敗しました'
    end
  end

  def index
    @posts = Post.all.includes(:user).order('created_at DESC')
  end

  def show; end

  def edit; end

  def update
    if @post.user == current_user
      flash[:notice] = '投稿を編集しました' if @post.update(post_params)
    else
      flash[:notice] = '投稿の修正に失敗しました'
    end
    redirect_to posts_path
  end

  def destroy
    if @post.user == current_user
      flash[:notice] = '投稿が削除されました' if @post.destroy
    else
      flash[:notice] = '投稿の削除に失敗しました'
    end
    redirect_to posts_path
  end

  private

  # ストロングパラメーターを設定（投稿には文字文章にログインユーザーのidを付与する）
  def post_params
    params.require(:post).permit(:text).merge(user_id: current_user.id)
  end

  # リファクタリングのためにあらかじめ、対象の投稿を探しておくメソッド
  def set_post
    @post = Post.find_by(id: params[:id])
  end
end
