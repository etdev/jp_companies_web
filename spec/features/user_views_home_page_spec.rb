require "rails_helper"

RSpec.feature "User views home page" do
  scenario "sees companies" do
    visit root_path
    expect(page).to have_css("[data-role='companies-list']")
  end

  scenario "sees home link" do
    visit root_path

    within ".nav--main" do
      expect(page).to have_css("[data-role=home_link]", text: t("app_name"))
    end
  end
end
