class Review < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  validates :restaurant_id, presence: true
  validates :content, presence: true
  validates :rating, inclusion: { in: 0..5 }, numericality: true, presence: true
end
