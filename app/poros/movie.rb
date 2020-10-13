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
      genre[:name]
    end
  end

  def runtime_in_hours
    hours = @runtime / 60
    rest = @runtime % 60
    "#{hours} hr #{rest} min"
  end

  # def reviews
  #   MovieFacade.reviews(@id)
  # end

end