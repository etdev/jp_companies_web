require "rails_helper"

RSpec.feature "User registers new company" do
  scenario "successfully" do
    visit new_company_registration_path

    fill_in "company_registration[name]", with: "Test Company"
    fill_in "company_registration[vorkers_id]", with: "a02524141"
    fill_in "company_registration[en_hyouban_id]", with: 22_145

    click_button t("company_registrations.form.submit")

    expect(page).to have_content(
      t("company_registrations.messages.create_success")
    )
  end
end
