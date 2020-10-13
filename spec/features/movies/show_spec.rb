require "rails_helper"

RSpec.describe "Movies show page" do
  describe "as a user" do
    before :each do
      attrs = {
      "adult": false,
      "backdrop_path": "/iNh3BivHyg5sQRPP1KOkzguEX0H.jpg",
      "budget": 25000000,
      "genres": [
        {
          "id": 18,
          "name": "Drama"
        },
        {
          "id": 80,
          "name": "Crime"
        }
      ],
      "homepage": "",
      "id": 278,
      "imdb_id": "tt0111161",
      "original_language": "en",
      "original_title": "The Shawshank Redemption",
      "overview": "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
      "popularity": 41.257,
      "poster_path": "/5KCVkau1HEl7ZzfPsKAPM0sMiKc.jpg",
      "production_companies": [
        {
          "id": 97,
          "logo_path": "/7znWcbDd4PcJzJUlJxYqAlPPykp.png",
          "name": "Castle Rock Entertainment",
          "origin_country": "US"
        }
      ],
      "production_countries": [
        {
          "iso_3166_1": "US",
          "name": "United States of America"
        }
      ],
      "release_date": "1994-09-23",
      "revenue": 28341469,
      "runtime": 142,
      "spoken_languages": [
        {
          "iso_639_1": "en",
          "name": "English"
        }
      ],
      "status": "Released",
      "tagline": "Fear can hold you prisoner. Hope can set you free.",
      "title": "The Shawshank Redemption",
      "video": false,
      "vote_average": 8.7,
      "vote_count": 17284
    }
      @movie = Movie.new(attrs)
      @user = User.create(name: "Drewni Coliams", email: "drewnicoliams@email.com", password: "123")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit "/movies/#{@movie.id}"
    end

    it "has button to create viewing party", :vcr do
      expect(page).to have_button("Create Viewing Party")
      click_on "Create Viewing Party"
      expect(current_path).to eq("/viewing_party/new")
    end

    it "has movie details", :vcr do
      expect(page).to have_content(@movie.title)
      expect(page).to have_content(@movie.vote_average)
      expect(page).to have_content(@movie.runtime)
      @movie.genres.each do |genre|
        expect(page).to have_content(genre)
      end
      expect(page).to have_content(@movie.summary)
      expect(page).to have_content(@movie.cast)
      expect(page).to have_content(@movie.review_count)
      expect(page).to have_content(@movie.review_author)
    end
  end
end
