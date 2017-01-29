require "rails_helper"

RSpec.feature "User views companies list" do
  scenario "sees company data" do
    create_list(:company, 2)

    visit companies_path

    within ".company-list" do
      expect(page).to have_css(company_css, count: 2)
    end
  end

  scenario "sees data sorted by rating" do
    create(:company, rating: 1)
    highly_rated_company = create(:company, rating: 2)

    visit companies_path

    within ".company-list" do
      expect(page.all(company_css).first)
        .to have_content(highly_rated_company.name)
    end
  end

  scenario "doesn't see disabled companies" do
    company = create(:company, is_enabled: false)

    visit companies_path

    within ".company-list" do
      expect(page).not_to have_content(company.name)
    end
  end

  scenario "sees paginated results" do
    create_list(:company, per_page + 1)

    visit companies_path

    expect(page).to have_css(company_css, count: per_page)
  end

  private

  def company_css
    "[data-role=company]"
  end

  # TODO: DUPE
  def per_page
    Company.default_per_page
  end
end
