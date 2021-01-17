class TopController < ApplicationController
  before_action :redirect_index
  def top; end

  private

  def redirect_index
    redirect_to posts_path if user_signed_in?
  end
end
