class User < ApplicationRecord
  has_many :reviews
  has_many :restaurants

  has_secure_password
end