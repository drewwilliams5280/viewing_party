class MovieService
  def self.top_rated
    (top_rated_page_one[:results] + top_rated_page_two[:results]).flatten
  end

  def self.search(keyword)
    (search_page_one(keyword)[:results] + search_page_two(keyword)[:results]).flatten
  end

  def self.movie_details(id)
    to_json("/3/movie/#{id}")
  end

  def self.reviews(id)
    to_json("/3/movie/#{id}/reviews")
  end

  def self.credits(id)
    to_json("/3/movie/#{id}/credits")
  end

  def self.videos(id)
    to_json("/3/movie/#{id}/videos")
  end

  def self.upcoming
    to_json('/3/movie/upcoming')
  end

  def self.top_rated_page_one
    to_json('/3/movie/top_rated', { language: 'en-US', page: 1 })
  end

  def self.top_rated_page_two
    to_json('/3/movie/top_rated', { language: 'en-US', page: 2 })
  end

  def self.search_page_one(keyword)
    to_json('/3/search/movie', { language: 'en-US', page: 1, query: keyword, include_adult: false })
  end

  def self.search_page_two(keyword)
    to_json('/3/search/movie', { language: 'en-US', page: 2, query: keyword, include_adult: false })
  end

  def self.to_json(url, params = {})
    private
    response = conn.get(url) do |f|
      f.params = params
      f.params[:api_key] = ENV['MOVIE_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    private
    Faraday.new(url: 'https://api.themoviedb.org')
  end
end
