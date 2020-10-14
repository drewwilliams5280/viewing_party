class User < ApplicationRecord
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :password, presence: true

  has_many :movie_parties, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships

  def parties_invited_to
    party_ids = PartyGuest.where(guest_id: id).map(&:movie_party_id)
    MovieParty.where(id: party_ids)
  end
end
