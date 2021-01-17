class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # ログイン後に移動するページを指定
  def after_sign_in_path_for(_resource)
    posts_path
    # user_path(resource)
  end

  # ログアウト後に移動するページを指定
  def after_sign_out_path_for(_resource)
    new_user_session_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name profile profile_photo])
  end
end
