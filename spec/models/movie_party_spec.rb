require 'rails_helper'

describe MovieParty do
  describe "relationships" do
    it { should have_many :party_guests }
    it { should have_many(:guests).through(:party_guests) }
    it { should belong_to :user }
  end

  describe "validations" do
    it { should validate_presence_of :movie_title }
    it { should validate_presence_of :movie_id }
    it { should validate_presence_of :runtime }
    it { should validate_presence_of :date }
    it { should validate_presence_of :time }
  end
end
