class TopController < ApplicationController
  before_action :redirect_profile
  def top; end


private
  def redirect_profile
    if user_signed_in?
      flash[:notice] = 'ログインしています'
      redirect_to homes_index_path
    end

  end

end
