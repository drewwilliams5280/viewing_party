require "rails_helper"

RSpec.describe "As a visitor" do
  before :each do
    @user = User.create(name: "Drewni Coliams", email: "drewnicoliams@email.com", password: "123")
  end

  it "I can log in" do
    visit '/'

    fill_in "email", with: @user.email
    fill_in "password", with: "1234"

    click_on "Log In"

    expect(page).to have_content("Your login credentials are incorrect")

    fill_in "email", with: @user.email
    fill_in "password", with: "123"

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
      expect(page).to have_field('email', :value => 'Friends Email')
      expect(page).to have_button('Add Friend')
      # click_on 'Add Friend'
    end
  end

  xit "can add friend" do
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

  xit "can not add friend because that are not in the system" do
    within "#friends-#{@user.id}" do
      fill_in :email, with: 'bobsmith@email.com'
      click_on 'Add Friend'
    end

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("Sorry your friend cannot be found")
  end

  xit "sees a viewing parties section" do
    within "#viewing_parties-#{@user.id}" do
      expect(page).to have_content(@user.viewing_parties.first.movie.title)
    end
  end

end
