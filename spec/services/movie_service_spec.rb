require 'rails_helper'
RSpec.describe MovieService do
  it 'returns top rated movie data', :vcr do
    movies = MovieService.top_rated
    expect(movies).to be_an Array
    movie_data = movies.first
    expect(movie_data).to have_key :title
    expect(movie_data[:title]).to be_a(String)
    expect(movie_data).to have_key :vote_average
    expect(movie_data[:vote_average]).to be_a(Float)
  end

  it 'returns search movie data', :vcr do
    movies = MovieService.search('dragon')
    expect(movies).to be_an Array
    movie_data = movies.first
    expect(movie_data).to have_key :title
    expect(movie_data[:title]).to be_a(String)
    expect(movie_data).to have_key :vote_average
    expect(movie_data[:vote_average]).to be_a(Float)
  end

  it 'returns specific movie details', :vcr do
    movie = MovieService.movie_details(278)
    expect(movie).to be_a Hash
    expect(movie).to have_key :title
    expect(movie[:title]).to be_a(String)
    expect(movie).to have_key :vote_average
    expect(movie[:vote_average]).to be_a(Float)
    expect(movie).to have_key :overview
    expect(movie[:overview]).to be_a(String)
    expect(movie).to have_key :runtime
    expect(movie[:runtime]).to be_an(Integer)
    expect(movie).to have_key :genres
    expect(movie[:genres]).to be_an(Array)
  end

  it 'can get movie credits', :vcr do
    credits = MovieService.credits(278)
    expect(credits).to be_a Hash
    expect(credits).to have_key :cast
    expect(credits[:cast]).to be_an(Array)
    cast_member_data = credits[:cast].first
    expect(cast_member_data).to have_key :name
    expect(cast_member_data).to have_key :character
  end

  it 'can get movie reviews', :vcr do
    reviews = MovieService.reviews(278)
    expect(reviews).to be_a Hash
    expect(reviews).to have_key :results
    expect(reviews).to have_key :total_results
    results = reviews[:results]
    expect(results).to be_an(Array)
    expect(results.first).to be_an(Hash)
    expect(results.first).to have_key :author
    expect(results.first).to have_key :content
  end

  it 'can get movie videos', :vcr do
    videos = MovieService.videos(278)
    expect(videos).to be_a Hash
    expect(videos).to have_key :results
    results = videos[:results]
    expect(results).to be_an(Array)
    expect(results.first).to be_an(Hash)
    expect(results.first).to have_key :key
  end

  it 'can get upcoming movie', :vcr do
    upcoming = MovieService.upcoming
    expect(upcoming).to be_a Hash
    expect(upcoming).to have_key :results
    results = upcoming[:results]
    expect(results).to be_an(Array)
    expect(results.first).to be_an(Hash)
    expect(results.first).to have_key :title
    expect(results.first).to have_key :vote_average
  end
end
