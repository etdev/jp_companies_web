require "rails_helper"

RSpec.feature "User searches for company" do
  scenario "finds matching company" do
    company = create(:company)

    visit companies_path

    fill_in "search[query]", with: company.name
    click_button t("companies.search_form.submit")

    expect(page).to have_css("[data-company_id='#{company.id}']")
  end

  scenario "doesn't find non-matching company" do
    company = create(:company, name: "company1")

    visit companies_path

    fill_in "search[query]", with: "company2"
    click_button t("companies.search_form.submit")

    expect(page).not_to have_css("[data-company_id='#{company.id}']")
  end

  scenario "finds case-insensitive matches" do
    company = create(:company, name: "company1")

    visit companies_path

    fill_in "search[query]", with: "Company1"
    click_button t("companies.search_form.submit")

    expect(page).to have_css("[data-company_id='#{company.id}']")
  end

  scenario "finds partial matches" do
    company = create(:company, name: "company1")

    visit companies_path

    fill_in "search[query]", with: "mpan"
    click_button t("companies.search_form.submit")

    expect(page).to have_css("[data-company_id='#{company.id}']")
  end
end
