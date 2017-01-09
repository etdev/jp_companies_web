require "rails_helper"

RSpec.describe "application/_main_nav.html.slim" do
  it "contains link to en_hyouban entries list" do
    render

    expect(rendered).to have_link(
             I18n.t("en_hyouban_entries.display_text"),
             href: en_hyouban_entries_path
    )
  end
end
