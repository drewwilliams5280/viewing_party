class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :password, presence: true

  has_many :party_guests, dependent: :destroy
  has_many :party_viewings, through: :party_guests
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
end
