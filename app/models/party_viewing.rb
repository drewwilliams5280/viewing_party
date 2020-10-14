class PartyViewing < ApplicationRecord
  validates_presence_of :movie_title, :movie_id, :runtime, :date, :time
  has_many :party_guests
  has_many :guests, through: :party_guests
  belongs_to :user
end
