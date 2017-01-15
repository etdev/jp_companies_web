require "rails_helper"

RSpec.describe "application/_main_nav.html.slim" do
  before(:each) do
    render
  end

  it "contains link to en_hyouban entries list" do
    expect(rendered).to have_link(
             I18n.t("en_hyouban_entries.display_text"),
             href: en_hyouban_entries_path
    )
  end

  it "contains link to vorkers entries list" do
      expect(rendered).to have_link(
              I18n.t("vorkers_entries.display_text"),
              href: vorkers_entries_path
      )
  end

  it "contains link to companies list" do
      expect(rendered).to have_link(
              I18n.t("companies.display_text"),
              href: companies_path
      )
  end
end
