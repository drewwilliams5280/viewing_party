require "rails_helper"

RSpec.describe "Movies index page" do
  describe "as a user" do
    before :each do
      @user = User.create(name: "Drewni Coliams", email: "drewnicoliams@email.com", password: "123")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    end

    it "lists top 40 movies", :vcr do
      visit '/discover'
      click_on "Find Top Rated Movies"
      expect(page).to have_button("Find Top Rated Movies")
      expect(page).to have_field("Search by movie title")
      expect(page).to have_button("Find Movies")
      expect(current_path).to eq(movies_path)
      expect(page).to have_css(".movie")

      within(first('.movie')) do
        expect(page).to have_css('.title')
        expect(page).to have_css('.vote_average')
      end
    end

    it "can list search movies", :vcr do
      visit '/discover'
      fill_in "Search by movie title", with: "dragon"
      click_on "Find Movie"
      expect(page).to have_button("Find Top Rated Movies")
      expect(page).to have_field("Search by movie title")
      expect(page).to have_button("Find Movies")
      expect(current_path).to eq(movies_path)
      expect(page).to have_css(".movie")

      within(first('.movie')) do
        expect(page).to have_content("Dragon")
        expect(page).to have_css('.title')
        expect(page).to have_css('.vote_average')
      end

    end
  end
end
