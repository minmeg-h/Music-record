class Post < ApplicationRecord
  belongs_to :user
  has_one :music, dependent: :destroy

  # musicモデルを子モデルとして扱う
  accepts_nested_attributes_for :music
end
