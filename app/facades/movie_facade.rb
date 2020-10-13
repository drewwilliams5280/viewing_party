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

  def self.movie_details(id)
    movie_details = MovieService.movie_details(id)
    movie = Movie.new(movie_details)
  end

  def self.reviews(id)
    MovieService.reviews(id)[:results].map do |review_details|
      review = Review.new(review_details)
    end
  end

end
