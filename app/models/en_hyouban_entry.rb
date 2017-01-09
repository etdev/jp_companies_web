class EnHyoubanEntry < ApplicationRecord

  validates :en_hyouban_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :average_salary, presence: true
  validates :rating, presence: true
  validates :ratings_count, presence: true
  validates :daily_hours_worked, presence: true
  validates :category, presence: true

  def self.by_highest_salary
    order(average_salary: :desc)
  end
end
