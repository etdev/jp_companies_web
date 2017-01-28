class EnHyoubanEntry < ApplicationRecord
  # TODO: DUPE
  MIN_RATINGS_COUNT = 10
  WEIGHT = 1

  belongs_to :company

  validates :en_hyouban_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :average_salary, presence: true
  validates :rating, presence: true, numericality: true
  validates :ratings_count, presence: true, numericality: true
  validates :daily_hours_worked, presence: true
  validates :category, presence: true

  # TODO: DUPE
  before_save :update_company_rating
  after_destroy :update_company_rating

  # TODO: DUPE
  default_scope ->() { where("ratings_count > ?", MIN_RATINGS_COUNT) }

  def weighted_rating
    WeightedRating::EnHyouban.new(self).rating
  end

  # TODO: DUPE
  def company
    self[:company] || NullCompany.new
  end

  def self.by_highest_salary
    order(average_salary: :desc)
  end

  private

  # TODO: DUPE
  def update_company_rating
    company.try(:update_rating)
  end
end
