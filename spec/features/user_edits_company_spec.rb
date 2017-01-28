require "rails_helper"

RSpec.feature "User edits company" do
  scenario "successfully" do
    company = create(:company)

    visit company_path(company)
    click_link t("companies.company.edit_btn")
    fill_in "company[name_jp]", with: "new_name_jp"
    click_button t("companies.form.submit")

    expect(page).to have_content("new_name_jp")
  end
end
