class VorkersEntry < ApplicationRecord
  MIN_RATINGS_COUNT = 10
  WEIGHT = 1

  belongs_to :company

  validates :vorkers_id, presence: true, uniqueness: true

  def weighted_rating
    WeightedRating::Vorkers.new(self).rating
  end
end
