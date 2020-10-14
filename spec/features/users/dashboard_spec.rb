require "rails_helper"

RSpec.describe "As a visitor" do
  before :each do
    @user = User.create(name: "Drewni Coliams", email: "drewnicoliams@email.com", password: "123")
  end

  it "I can log in" do
    visit '/'
    fill_in "email", with: @user.email
    fill_in "password", with: "5678"

    click_on "Log In"

    expect(page).to have_content("Your login credentials are incorrect")

    fill_in "email", with: @user.email
    fill_in "password", with: @user.password

    click_on "Log In"

    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("Welcome #{@user.name}!")
  end

  it "displays error message when not logged in and visiting dashboard" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(nil)

    visit '/dashboard'

    expect(page).to have_content("You are not authorized to access this page")
    expect(page).to have_content("401")
  end
end

RSpec.describe "As a User" do
  before :each do
    @user = User.create(name: "Drewni Coliams", email: "drewnicoliams@email.com", password: "123")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit '/dashboard'
  end

  it "sees a button to discover movies" do
    expect(page).to have_button('Discover Movies')

    click_on 'Discover Movies'

    expect(current_path).to eq('/discover')
  end

  it "sees a friends section" do
    within "#friends-#{@user.id}" do
      expect(page).to have_content('Friends')
      expect(page).to have_content('You have no friends added yet')
      expect(page).to have_field('email')
      expect(page).to have_button('Add Friend')
    end
  end

  it "can add friend" do
    alex = User.create(name: 'Alex', email: 'alex@email.com', password: '123')

    within "#friends-#{@user.id}" do
      fill_in :email, with: alex.email
      click_on 'Add Friend'
    end

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Friend successfully added")
    expect(@user.friends.first).to eq(alex)

    within "#friends-#{@user.id}" do
      expect(page).to have_content(alex.name)
    end
  end

  it "can not add friend because they are not in the system" do
    within "#friends-#{@user.id}" do
      fill_in :email, with: 'bobsmith@email.com'
      click_on 'Add Friend'
    end

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Sorry your friend cannot be found")
  end

  it "sees a viewing parties section" do
    within "#viewing-parties-#{@user.id}" do
      expect(page).to have_content('Viewing Parties')
    end
  end

  it "sees viewing parties invited to", :vcr do
    @hank = User.create!(name: "Hank Hill", email: "hank@email.com", password: "123")
    @friendship1 = Friendship.create(friend: @user, user: @hank)
    @friendship2 = Friendship.create(friend: @hank, user: @user)
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
    # require "pry"; binding.pry
    @party1 = PartyViewing.create!(movie_id: @movie.id, movie_title: @movie.title, runtime: @movie.runtime, date: "10/13/2020", time: "4:00", user: @user)
    PartyGuest.create(party_viewing_id: @party1.id, guest_id: @hank.id)
    @party2 = PartyViewing.create!(movie_id: @movie.id, movie_title: @movie.title, runtime: @movie.runtime, date: "10/13/2020", time: "4:00", user: @hank)
    PartyGuest.create(party_viewing_id: @party2.id, guest_id: @user.id)
    within "#viewing-parties-#{@user.id}" do
      expect(page).to have_content(@party1.movie_title)
      expect(page).to have_content(@party1.date)
      expect(page).to have_content(@party1.time)
      expect(page).to have_content("Hosting")
      expect(page).to have_content(@party2.movie_title)
      expect(page).to have_content(@party2.date)
      expect(page).to have_content(@party2.time)
      expect(page).to have_content("Invited")
    end
  end

end
