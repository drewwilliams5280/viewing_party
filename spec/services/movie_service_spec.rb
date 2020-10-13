require 'rails_helper'
RSpec.describe MovieService do
  it 'returns movie data', :vcr do
    movies = MovieService.top_rated
    expect(movies).to be_an Array
    movie_data = movies.first
    expect(movie_data).to have_key :title
    expect(movie_data[:title]).to be_a(String)
    expect(movie_data).to have_key :vote_average
    expect(movie_data[:vote_average]).to be_a(Float)
  end
end
