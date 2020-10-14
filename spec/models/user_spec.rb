require 'rails_helper'

describe User do
  describe "relationships" do
    it { should have_many :friendships}
    it { should have_many(:friends).through(:friendships) }
  end

  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :email}
    it {should validate_presence_of :password}
  end

  describe "instance methods" do
    it "can get parties invited to" do
      user = User.create(name: "Bob", email: "bob@email.com", password: "123")
      user2 = User.create(name: "Job", email: "job@email.com", password: "123")
      party = MovieParty.create(movie_title: "Shawshank", runtime: 222, date: "12/3/2020", time: "4:00", movie_id: 3, user_id: user.id)
      PartyGuest.create(movie_party_id: party.id, guest_id: user2.id)
      expect(user).to be_a(User)
      expect(user2.parties_invited_to).to eq([party])
    end
  end
end
