class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
  validates :profile, length: { maximum: 200 }

  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation]
      params.delete(:password)
      params.delete(:password_confirmation)
    end
    # result = update_attributes(params, *options)はRails6から非推奨の書き方になった
    result = update(params, *options)
    clean_up_passwords
    result
  end
end
