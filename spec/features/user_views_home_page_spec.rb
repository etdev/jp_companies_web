require "rails_helper"

RSpec.feature "User views home page" do
  scenario "sees welcome message" do
    visit root_path
    expect(page).to have_content(I18n.t("homes.show.welcome_message"))
  end

  scenario "sees welcome message" do
    visit root_path

    within ".main-nav" do
      expect(page).to have_css("[data-role=home_link]", text: I18n.t("app_name"))
    end
  end
end
