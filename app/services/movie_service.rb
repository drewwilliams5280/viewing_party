class MovieService

  def self.top_rated
    (top_rated_page_one[:results] + top_rated_page_two[:results]).flatten
  end

  def self.search(keyword)
    (search_page_one(keyword)[:results] + search_page_two(keyword)[:results]).flatten
  end

  def self.movie_details(id)
    response = conn.get("/3/movie/#{id}") do |f|
      f.params[:api_key] = ENV['MOVIE_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.reviews(id)
    response = conn.get("/3/movie/#{id}/reviews") do |f|
      f.params[:api_key] = ENV['MOVIE_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.credits(id)
    response = conn.get("/3/movie/#{id}/credits") do |f|
      f.params[:api_key] = ENV['MOVIE_API_KEY']
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  # def to_json(url)
  #   response = conn.get(url)
  #   JSON.parse(response.body, symbolize_names: true)
  # end

  def self.conn
    Faraday.new(url: 'https://api.themoviedb.org') # do |f|
    #  f.params[:api_key] = ENV['MOVIE_API_KEY']
  end

  def self.top_rated_page_one
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=1")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.top_rated_page_two
    response = conn.get("/3/movie/top_rated?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&page=2")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_page_one(keyword)
    response = conn.get("3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&query=#{keyword}&page=1&include_adult=false")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.search_page_two(keyword)
    response = conn.get("3/search/movie?api_key=#{ENV['MOVIE_API_KEY']}&language=en-US&query=#{keyword}&page=2&include_adult=false")
    JSON.parse(response.body, symbolize_names: true)
  end
end
