class MoviesController < ApplicationController

  def index
    if params[:q]
      conn = Faraday.new(url: 'https://api.themoviedb.org')
      response1 = conn.get('/3/movie/top_rated') do |faraday|
        faraday.params['api_key'] = ENV['MOVIE_API_KEY']
        faraday.params['page'] = '1'
      end
      response2 = conn.get('/3/movie/top_rated') do |faraday|
        faraday.params['api_key'] = ENV['MOVIE_API_KEY']
        faraday.params['page'] = '2'
      end
      json1 = JSON.parse(response1.body, symbolize_names: true)
      json2 = JSON.parse(response2.body, symbolize_names: true)
      @movies = (json1[:results] + json2[:results]).flatten
    elsif params[:search]
      conn = Faraday.new(url: 'https://api.themoviedb.org')
      response1 = conn.get('/3/search/movie') do |faraday|
        faraday.params['api_key'] = ENV['MOVIE_API_KEY']
        faraday.params['query'] = params[:search]
        faraday.params['page'] = "1"
      end
      response2 = conn.get('/3/search/movie') do |faraday|
        faraday.params['api_key'] = ENV['MOVIE_API_KEY']
        faraday.params['query'] = params[:search]
        faraday.params['page'] = "2"
      end
      json1 = JSON.parse(response1.body, symbolize_names: true)
      json2 = JSON.parse(response2.body, symbolize_names: true)
      @movies = (json1[:results] + json2[:results]).flatten
    end
  end

end
