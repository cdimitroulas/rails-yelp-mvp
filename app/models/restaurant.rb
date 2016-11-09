class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :category,
            inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] },
            presence: true
end
