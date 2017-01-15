require "rails_helper"

RSpec.feature "User views companies list" do
  scenario "and sees company data" do
    create_list(:company, 2)

    visit companies_path

    within ".companies" do
      expect(page).to have_css(company_css, count: 2)
    end
  end

  private

  def company_css
    "[data-role=company]"
  end
end
