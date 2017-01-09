require "rails_helper"

RSpec.feature "User views Vorkers Entry" do
  scenario "sees detailed info" do
    entry = create(:vorkers_entry)

    visit vorkers_entry_path(entry)

    expect(page).to have_content(entry.vorkers_id)
  end

  scenario "sees link to original URL" do
    entry = create(:vorkers_entry)

    visit vorkers_entry_path(entry)

    expect(page).to have_link(
      I18n.t("vorkers_entries.vorkers_entry.view_original"),
      href: entry.url
    )
  end
end
