class PartyGuest < ApplicationRecord
  validates :movie_party_id, :guest_id, presence: true

  belongs_to :movie_party
  belongs_to :guest, class_name: 'User'
end
