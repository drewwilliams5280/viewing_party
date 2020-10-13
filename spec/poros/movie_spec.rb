require 'rails_helper'
RSpec.describe Movie do
  it 'exists' do
    attrs_1 = {
  "genres": [
    {
      "id": 18,
      "name": "Drama"
    },
    {
      "id": 80,
      "name": "Crime"
    }
  ],
  "id": 278,
  "overview": "Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.",
  "runtime": 142,
  "title": "The Shawshank Redemption",
  "vote_average": 8.7
}
    movie_result = Movie.new(attrs_1)
    expect(movie_result).to be_a Movie
    expect(movie_result.title).to eq("The Shawshank Redemption")
    expect(movie_result.vote_average).to eq(8.7)
    expect(movie_result.runtime).to eq(142)
    expect(movie_result.runtime_in_hours).to eq("2 hr 22 min")
    expect(movie_result.genres).to eq(["Drama", "Crime"])
    expect(movie_result.summary).to eq("Framed in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an amoral warden. During his long stretch in prison, Dufresne comes to be admired by the other inmates -- including an older prisoner named Red -- for his integrity and unquenchable sense of hope.")
    expect(movie_result.id).to eq(278)
  end
end
