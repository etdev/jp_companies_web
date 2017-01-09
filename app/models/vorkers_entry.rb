class VorkersEntry < ApplicationRecord
  MIN_RATINGS_COUNT = 10

  validates :vorkers_id, presence: true, uniqueness: true

  def weighted_rating
    VorkersWeightedRating.new(self).rating
  end
end
