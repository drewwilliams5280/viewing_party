class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates_presence_of :name
  validates_presence_of :password, require: true

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

end
