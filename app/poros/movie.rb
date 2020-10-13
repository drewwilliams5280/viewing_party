class Movie
  attr_reader :attributes,
              :id,
              :summary,
              :vote_average,
              :title,
              :runtime
  def initialize(attributes)
    @attributes = attributes
    @id = attributes[:id]
    @summary = attributes[:overview]
    @vote_average = attributes[:vote_average]
    @title = attributes[:title]
    @runtime = attributes[:runtime]
  end

  def genres
    @attributes[:genres].map do |genre|
      genre[:name] if attributes[:genres]
    end
  end

  def reviews
    MovieService.reviews(@id)[:results].map do |review_details|
      review = Review.new(review_details)
    end
  end

end
