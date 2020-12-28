class RegistrationsController < Devise::RegistrationsController
  protected
  #パスワードなしでユーザー情報の変更ができる
  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  #ユーザー情報変更後のリダイレクト先を指定
  def after_update_path_for(resource)
    user_path(resource)
  end
end
