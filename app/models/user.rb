class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
  validates :profile, length: { maximum: 200 }
  validate :password_complexity

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

  def password_complexity
    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,70}$/

    errors.add :password, 'パスワードの強度が不足しています。パスワードの長さは8文字以上とし、大文字と小文字と数をそれぞれ1文字以上含める必要があります。'
  end
end
