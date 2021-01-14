class PostsController < ApplicationController
  def new
    @post = Post.new
    #@post.music.build
  end

  def create
    @post = Post.new(post_params)
  end

  private
    def post_params
      params.require(:post).permit(:text, :image)
    end

end
