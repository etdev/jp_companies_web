require "rails_helper"

RSpec.feature "User views en_hyouban entries list" do
  scenario "sees list of en_hyouban entries" do
    create_list(:en_hyouban_entry, 2)

    visit en_hyouban_entries_path

    within ".en-hyouban-entries" do
      expect(page).to have_css(
        "[data-role=en-hyouban-entry]",
        count: 2
      )
    end
  end
end
