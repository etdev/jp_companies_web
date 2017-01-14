class EnHyoubanEntry < ApplicationRecord
  MIN_RATINGS_COUNT = 10
  WEIGHT = 1

  validates :en_hyouban_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :average_salary, presence: true
  validates :rating, presence: true, numericality: true
  validates :ratings_count, presence: true, numericality: true
  validates :daily_hours_worked, presence: true
  validates :category, presence: true

  default_scope ->() { where("ratings_count > ?", MIN_RATINGS_COUNT) }

  def weighted_rating
    WeightedRating::EnHyouban.new(self).rating
  end

  def self.by_highest_salary
    order(average_salary: :desc)
  end
end
