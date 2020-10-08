require "rails_helper"

RSpec.describe "Movies index page" do
  describe "as a user" do
    before :each do
      @user = User.create(name: "Drewni Coliams", email: "drewnicoliams@email.com", password: "123")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "has correct buttons", :vcr do
      visit '/movies'
      expect(page).to have_button("Find Top Rated Movies")
      expect(page).to have_field("Search by movie title")
      expect(page).to have_button("Find Movies")
    end

    it "lists top 40 movies", :vcr do
      visit '/discover'
      click_on "Find Top Rated Movies"
      expect(current_path).to eq(movies_path)
      expect(page).to have_css(".movie")

      within(first('#movie')) do
        expect(page).to have_css('.title')
        expect(page).to have_css('.vote_average')
      end
    end
  end
end
