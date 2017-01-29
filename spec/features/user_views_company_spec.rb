require "rails_helper"

RSpec.feature "User views company" do
  scenario "sees detailed info about given company" do
    company = create(:company)

    visit company_path(company)

    expect(page).to have_css("[data-company_id='#{company.id}']")
  end
end
