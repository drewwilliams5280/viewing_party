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
    movie_result = Movie.new(attrs_1)
    expect(movie_result).to be_a Movie
    expect(movie_result.title).to eq("Gabriel's Inferno Part II")
    expect(movie_result.vote_average).to eq(8.9)
    # expect(movie_result.runtime).to eq("")
    # expect(movie_result.genres).to eq("")
    expect(movie_result.summary).to eq("Professor Gabriel Emerson finally learns the truth about Julia Mitchell's identity, but his realization comes a moment too late. Julia is done waiting for the well-respected Dante specialist to remember her and wants nothing more to do with him. Can Gabriel win back her heart before she finds love in another's arms?")
    expect(movie_result.id).to eq(724089)
  end
end
