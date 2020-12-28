# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController


   protected
   # パスワードなしでユーザー情報の変更ができる
   def update_resource(resource, params)
     resource.update_without_current_password(params)
   end

   # ユーザー情報変更後のリダイレクト先を指定
   def after_update_path_for(resource)
     user_path(resource)
   end
 end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
