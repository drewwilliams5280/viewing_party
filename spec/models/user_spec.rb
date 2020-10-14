require 'rails_helper'

describe User do
  describe "relationships" do
    it { should have_many :friendships}
    it { should have_many(:friends).through(:friendships) }
    # it { should have_many :party_guests}
    it { should have_many(:party_viewings).through(:party_guests) }
    it { should have_many :party_viewings }
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :email}
    it {should validate_presence_of :password}
  end
end
