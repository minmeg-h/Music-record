class Post < ApplicationRecord
  belongs_to :user
  has_one :musics, dependent: :destroy
  accepts_nested_attributes_for :musics
end
