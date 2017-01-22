require "rails_helper"

RSpec.describe "application/_main_nav.html.slim" do
  before(:each) do
    render
  end

  it "contains link to companies list" do
      expect(rendered).to have_link(
              I18n.t("companies.display_text"),
              href: companies_path
      )
  end
end
