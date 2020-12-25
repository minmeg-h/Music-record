class TopController < ApplicationController
  before_action :redirect_index
  def top; end


private
  def redirect_index
    if user_signed_in?
      redirect_to homes_index_path
    end
  end
end
