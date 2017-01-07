require "rails_helper"

RSpec.feature "User views en_hyouban entry" do
  scenario "sees detailed info about given entry" do
    entry = create(:en_hyouban_entry)

    visit en_hyouban_entry_path(entry)

    expect(page).to have_css(
      "[data-role=en_hyouban_id]",
      text: entry.en_hyouban_id
    )
  end
end
