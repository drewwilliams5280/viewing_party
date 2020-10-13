class MovieFacade

  def self.top_rated
    MovieService.top_rated.map do |movie_data|
      Movie.new(movie_data)
    end
  end

  def self.search(keyword)
    MovieService.search(keyword).map do |movie_data|
      Movie.new(movie_data)
    end
  end

end
