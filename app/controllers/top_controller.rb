class TopController < ApplicationController
  def top;
    flash[:notice] = "ログインしています" if user_signed_in?
    redirect_to  user_path(current_user)
  end

end
