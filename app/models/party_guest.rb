class PartyGuest < ApplicationRecord
  belongs_to :party_viewing
  belongs_to :guest, class_name: 'User'
end
