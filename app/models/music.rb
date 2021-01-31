class Music < ApplicationRecord
  belongs_to :post
  validates :image, presence: true
end
