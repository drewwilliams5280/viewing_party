class Movie
  attr_reader :attributes,
              :id,
              :summary,
              :vote_average,
              :title,
              :runtime
  attr_accessor :reviews,
                :cast,
                :trailer_url
  def initialize(attributes)
    @attributes = attributes
    @id = attributes[:id]
    @summary = attributes[:overview]
    @vote_average = attributes[:vote_average]
    @title = attributes[:title]
    @runtime = attributes[:runtime]
    @reviews = []
    @cast = []
    @trailer_url = ""
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
end
