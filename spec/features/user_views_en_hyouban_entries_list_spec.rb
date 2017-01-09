require "rails_helper"

RSpec.feature "User views en_hyouban entries list" do
  scenario "sees list of en_hyouban entries" do
    create_list(:en_hyouban_entry, 2)

    visit en_hyouban_entries_path

    within ".en-hyouban-entries" do
      expect(page).to have_css(en_hyouban_entry_css, count: 2)
    end
  end

  scenario "paginates results" do
    create_list(:en_hyouban_entry, per_page + 1)

    visit en_hyouban_entries_path

    expect(page).to have_css(en_hyouban_entry_css, count: per_page)
  end

  scenario "shows pagination links" do
    create_list(:en_hyouban_entry, per_page + 1)

    visit en_hyouban_entries_path

    expect(page).to have_css(".pagination")
  end

  private

  def en_hyouban_entry_css
    "[data-role=en-hyouban-entry]"
  end

  def per_page
    EnHyoubanEntry.default_per_page
  end
end