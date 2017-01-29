class Company < ApplicationRecord
  has_one :vorkers_entry
  has_one :en_hyouban_entry

  delegate :average_salary, to: :en_hyouban_entry, allow_nil: true

  validates :rating, presence: true, numericality: true

  after_create :update_rating

  def ratings_count
    entries.map(&:ratings_count).sum
  end

  def update_rating
    return if entries.blank?
    self.rating = entries.map(&:weighted_rating).sum
      .fdiv(entries.count)

    save!
  end

  # categories
  def categories
    custom_categories || entries.map(&:category).join("、")
  end

  # TODO: REFACTOR (view-specific)
  def average_salary_en
    return "???" unless average_salary.present?

    "¥#{average_salary.fdiv(100)}M"
  end

  def self.by_rating
    order(rating: :desc)
  end

  def self.enabled
    where(is_enabled: true)
  end

  private

  def entries
    [vorkers_entry, en_hyouban_entry]
      .compact
  end
end
