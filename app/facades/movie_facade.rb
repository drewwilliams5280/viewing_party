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

  def self.get_movie_details(id)
    movie = movie_details(id)
    movie.reviews = reviews(movie.id)
    movie.cast = top_ten_cast(movie.id)
    movie.trailer_url = get_trailer_url(movie.id)
    movie
  end

  def self.movie_details(id)
    movie_details = MovieService.movie_details(id)
    Movie.new(movie_details)
  end

  def self.reviews(id)
    MovieService.reviews(id)[:results].map do |review_details|
      Review.new(review_details)
    end
  end

  def self.top_ten_cast(id)
    MovieService.credits(id)[:cast][0..9].map do |cast_member_details|
      CastMember.new(cast_member_details)
    end
  end

  def self.get_trailer_url(id)
    if MovieService.videos(id)[:results].empty?
      "uKLSQPhERnU"
    else
      MovieService.videos(id)[:results][0][:key]
    end
  end
end
