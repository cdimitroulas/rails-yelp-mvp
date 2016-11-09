class User < ApplicationRecord
  has_many :reviews
  has_many :restaurants

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_secure_password
end
