require "rails_helper"

RSpec.describe 'New viewing party page' do
  before :each do
    @drewni = User.create(name: "Drewni Coliams", email: "drewnicoliams@email.com", password: "123")
    @hank = User.create(name: "Hank Hill", email: "hank@email.com", password: "123")
    @domer = User.create(name: "Homer Simpson", email: "homer@email.com", password: "123")

    @friendship1 = Friendship.create(friend: @drewni, user: @hank)
    @friendship2 = Friendship.create(friend: @hank, user: @drewni)

    @friendship3 = Friendship.create(friend: @drewni, user: @homer)
    @friendship4 = Friendship.create(friend: @homer, user: @drewni)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@drewni)

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
    @movie = Movie.new(attrs_1)
    visit "/movies/#{@movie.id}"
    click_on 'Create Viewing Party'
  end

  it "can see a form with the following details", :vcr do
    expect(current_path).to eq("/viewing_party/new")

    expect(page).to have_content(@movie.title)
    expect(page).to have_content(@movie.runtime)
    expect(page).to have_field(:date)
    fill_in :date, with: "10/13/2020"
    expect(page).to have_field(:start_time)
    fill_in :start_time, with: "4:00"
    expect(page).to have_content(@homer.email)
    expect(page).to have_content(@hank.email)
    check("#{@homer.email}")
    check("#{@hank.email}")
    expect(page).to have_button("Create Party")
    click_on "Create Party"

    expect(current_path).to eq("/viewing_party/create")
  end
end
