require "rails_helper"

RSpec.describe "As a user" do
  before :each do
    @user = User.create(name: "Drewni Coliams", email: "drewnicoliams@email.com", password: "123")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    visit '/discover'
  end

  it "can see button for top 40 movies", :vcr do
    expect(page).to have_button("Find Top Rated Movies")
    click_on 'Find Top Rated Movies'
    expect(current_path).to eq('/movies')
  end

  it "can see form to search by movie title", :vcr do
    expect(page).to have_field("Search by movie title")
    fill_in "Search by movie title", with: "How to Train Your Dragon"
    click_on "Find Movies"
    expect(current_path).to eq('/movies')
  end
end
