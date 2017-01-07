require "rails_helper"

RSpec.feature "User views home page" do
  scenario "sees welcome message" do
    visit root_path
    expect(page).to have_content("Welcome")
  end
end
