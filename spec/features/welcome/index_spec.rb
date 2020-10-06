require "rails_helper"

RSpec.describe "As a visitor" do
  it "the welcome page displays a message, description, log-in link and registration link" do
    visit '/'
    expect(page).to have_content("Welcome to Viewing Party!")
    expect(page).to have_content("Viewing Party is an app that lets you")
    expect(page).to have_link("Log In")
    expect(page).to have_link("Register")
  end

end
