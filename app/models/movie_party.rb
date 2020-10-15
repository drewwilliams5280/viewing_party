class MovieParty < ApplicationRecord
  has_many :party_guests, dependent: :destroy
  has_many :guests, through: :party_guests, class_name: 'User'

  belongs_to :user

  validates :movie_title, :movie_id, :runtime, :date, :time, presence: true
end
