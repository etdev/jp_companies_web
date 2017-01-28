class VorkersEntry < ApplicationRecord
  # TODO: DUPE
  MIN_RATINGS_COUNT = 10
  WEIGHT = 1

  belongs_to :company

  validates :vorkers_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :rating, presence: true, numericality: true

  # TODO: DUPE
  before_save :update_company_rating
  after_destroy :update_company_rating

  # TODO: DUPE
  default_scope ->() { where("ratings_count > ?", MIN_RATINGS_COUNT) }

  def weighted_rating
    WeightedRating::Vorkers.new(self).rating
  end

  # TODO: DUPE
  def company
    self[:company] || NullCompany.new
  end

  private

  # TODO: DUPE
  def update_company_rating
    company.update_rating
  end
end
