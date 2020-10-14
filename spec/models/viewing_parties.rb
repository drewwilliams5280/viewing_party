require 'rails_helper'

describe ViewingParties do
  describe "relationships" do
    it { should have_many :party_guests }
    it { should have_many(:guests).through(:party_guests) }
    it { should belong_to :user }
  end

  describe "validations" do
    it { validates_presence_of :movie_id }
    it { validates_presence_of :runtime }
    it { validates_presence_of :date }
    it { validates_presence_of :time }
  end
end
