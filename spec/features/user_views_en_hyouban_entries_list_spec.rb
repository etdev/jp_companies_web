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

  scenario "shows companies sorted by average salary" do
    create(:en_hyouban_entry, average_salary: 1)
    high_paying_entry = create(:en_hyouban_entry, average_salary: 2)

    visit en_hyouban_entries_path

    expect(page.all(en_hyouban_entry_css).first)
      .to have_content(high_paying_entry.en_hyouban_id)
  end

  scenario "doesn't show if too few ratings" do
    shown_entry = create(
      :en_hyouban_entry,
      ratings_count: min_ratings_count + 1
    )
    unshown_entry = create(
      :en_hyouban_entry,
      ratings_count: min_ratings_count - 1
    )

    visit en_hyouban_entries_path

    expect(page).to have_content(shown_entry.en_hyouban_id)
    expect(page).not_to have_content(unshown_entry.en_hyouban_id)
  end

  private

  def en_hyouban_entry_css
    "[data-role=en-hyouban-entry]"
  end

  def per_page
    EnHyoubanEntry.default_per_page
  end

  def min_ratings_count
    EnHyoubanEntry::MIN_RATINGS_COUNT
  end
end
