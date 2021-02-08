class Music < ApplicationRecord
  belongs_to :post
  validates :tracks, presence: true
  validates :artist, presence: true
end
