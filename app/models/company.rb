class Company < ApplicationRecord
  has_one :vorkers_entry
  has_one :en_hyouban_entry

  delegate :average_salary, to: :en_hyouban_entry, allow_nil: true

  validates :rating, presence: true, numericality: true

  def ratings_count
    entries.map(&:ratings_count).sum
  end

  def update_rating
    self.rating = entries.map(&:weighted_rating).sum
      .fdiv(entries.count)

    save!
  end

  # categores (jp)
  def categories
    entries.map(&:category).join("、")
  end

  # TODO: REFACTOR (move to decorator etc)
  def average_salary_en
    return "???" unless average_salary.present?

    "¥#{ average_salary.fdiv(100) }M"
  end

  def self.by_rating
    order(rating: :desc)
  end

  private

  def entries
    [vorkers_entry, en_hyouban_entry]
      .compact
  end
end
