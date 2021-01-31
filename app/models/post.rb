class Post < ApplicationRecord
  belongs_to :user
  has_one :music, dependent: :destroy
end
