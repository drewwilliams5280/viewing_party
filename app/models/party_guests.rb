class PartyGuests < ApplicationRecord
  belongs_to :viewing_party
  belongs_to :guest, class_name: 'User'
end
