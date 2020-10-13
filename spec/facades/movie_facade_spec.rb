require 'rails_helper'
RSpec.describe 'Movie Facade' do
  it 'returns a list of movie objects for the top rated movies', :vcr do
    movies = MovieFacade.top_rated
    expect(movies).to be_an(Array)
    expect(movies.first).to be_a(Movie)
    expect(movies.first.title).to be_a(String)
  end
  it "returns a list of movie objects for searched movies", :vcr do
    movies = MovieFacade.search('dragon')
    expect(movies).to be_an(Array)
    expect(movies.first).to be_a(Movie)
    expect(movies.first.title).to be_a(String)
  end
  it "can get reviews", :vcr do
    movie = MovieFacade.search('shawshank redemption').last
    reviews = MovieFacade.reviews(movie.id)
    expect(reviews).to be_an(Array)
    expect(reviews.first).to be_a(Review)
    expect(reviews.first.author).to be_a(String)
  end
  it "can get cast", :vcr do
    movie = MovieFacade.search('shawshank redemption').last
    cast = MovieFacade.top_ten_cast(movie.id)
    expect(cast).to be_an(Array)
    expect(cast.first).to be_a(CastMember)
    expect(cast.first.name).to be_a(String)
    expect(cast.first.character).to be_a(String)
  end
end
