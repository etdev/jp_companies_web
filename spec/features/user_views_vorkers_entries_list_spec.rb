require "rails_helper"

RSpec.feature "User views vorkers entries list" do
  scenario "sees list of vorkers entries" do
    create_list(:vorkers_entry, 2)

    visit vorkers_entries_path

    within ".vorkers-entries" do
      expect(page).to have_css(vorkers_entry_css, count: 2)
    end
  end

  scenario "sees paginated entries" do
    create_list(:vorkers_entry, per_page + 1)

    visit vorkers_entries_path

    within ".vorkers-entries" do
      expect(page).to have_css(vorkers_entry_css, count: per_page)
    end
  end

  scenario "sees pagination links" do
    create_list(:vorkers_entry, per_page + 1)

    visit vorkers_entries_path

    expect(page).to have_css(".pagination")
  end

  private

  def vorkers_entry_css
    "[data-role=vorkers-entry]"
  end

  def per_page
    EnHyoubanEntry.default_per_page
  end
end
