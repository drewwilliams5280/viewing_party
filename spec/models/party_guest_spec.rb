require 'rails_helper'

describe PartyGuest do
  describe "relationships" do
    it { should belong_to :movie_party }
    it { should belong_to :guest }
  end
end
