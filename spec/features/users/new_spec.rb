require "rails_helper"

RSpec.describe "As a visitor" do
  it "can register and create a new user with a happy and sad path" do
    @user = User.create(name: "Drewni Coliams", email: "drewnicoliams@email.com", password: "123")
    visit '/registration'
    fill_in "email", with: "drewnicoliams@email.com"
    fill_in "password", with: "123"
    fill_in "password_confirmation", with: "123"
    click_on "Register"
    expect(page).to have_content("Email has already been taken")
    fill_in "email", with: "johndoe@email.com"
    fill_in "password", with: "123"
    fill_in "password_confirmation", with: "1234"
    click_on "Register"
    expect(page).to have_content("Passwords do not match")
    fill_in "name", with: "John Doe"
    fill_in "email", with: "johndoe@email.com"
    fill_in "password", with: "123"
    fill_in "password_confirmation", with: "123"
    click_on "Register"
    expect(current_path).to eq("/dashboard")
    expect(page).to have_content("You are now registered and logged in")
    expect(User.count).to eq(2)
  end

end
