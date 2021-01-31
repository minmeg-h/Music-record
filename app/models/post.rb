class Post < ApplicationRecord
  belongs_to :user
  has_many :musics, dependent: :destroy
end
