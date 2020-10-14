require 'rails_helper'

describe PartyGuests do
  describe "relationships" do
    it { should belong_to :viewing_party }
    it { should belong_to :guest }
  end
end
