require 'rails_helper'
RSpec.describe Movie do
  it 'exists' do
    attrs_1 = {
      "popularity": 12.864,
      "vote_count": 869,
      "video": false,
      "poster_path": "/pci1ArYW7oJ2eyTo2NMYEKHHiCP.jpg",
      "id": 724089,
      "adult": false,
      "backdrop_path": "/jtAI6OJIWLWiRItNSZoWjrsUtmi.jpg",
      "original_language": "en",
      "original_title": "Gabriel's Inferno Part II",
      "genre_ids": [
        10749
      ],
      "title": "Gabriel's Inferno Part II",
      "vote_average": 8.9,
      "overview": "Professor Gabriel Emerson finally learns the truth about Julia Mitchell's identity, but his realization comes a moment too late. Julia is done waiting for the well-respected Dante specialist to remember her and wants nothing more to do with him. Can Gabriel win back her heart before she finds love in another's arms?",
      "release_date": "2020-07-31"
    }
  attrs_2 = {
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
    movie_result_1 = Movie.new(attrs_1)
    movie_result_2 = Movie.new(attrs_2)
    require "pry"; binding.pry
    expect(movie_result).to be_a Movie
    expect(movie_result.title).to eq("Gabriel's Inferno Part II")
    expect(movie_result.vote_average).to eq(8.9)
    # expect(movie_result.runtime).to eq("")
    # expect(movie_result.genres).to eq("")
    expect(movie_result.summary).to eq("Professor Gabriel Emerson finally learns the truth about Julia Mitchell's identity, but his realization comes a moment too late. Julia is done waiting for the well-respected Dante specialist to remember her and wants nothing more to do with him. Can Gabriel win back her heart before she finds love in another's arms?")
    expect(movie_result.id).to eq(724089)
  end
end
