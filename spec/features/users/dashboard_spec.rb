require "rails_helper"

RSpec.describe "As a visitor" do
  before :each do
    user = create(:user)
 #ActiveRecord::RecordInvalid Validation failed: Password can't be blank, Password can't be blank
  end
  it "I can log in" do
    # user = User.create(name: "Drewni Coliams", email: "drewnicoliams@email.com", password: "123")
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
