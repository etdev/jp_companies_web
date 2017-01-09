class VorkersWeightedRating
  attr_reader :entry

  MAX_RATING = 100

  ATTR_WEIGHTS = {
    rating: 0.5,
    ratings_count: 0.2,
    monthly_overtime: 0.15,
    percent_vacation_used: 0.15
  }

  ATTR_TRANSFORMERS = {
    rating: ->(rating) { rating * 20 },
    ratings_count: ->(ratings_count) {
      if ratings_count < VorkersEntry::MIN_RATINGS_COUNT
        0
      else
        [ratings_count, 100].min
      end
    },
    monthly_overtime: ->(monthly_overtime) {
      [100 - monthly_overtime, 0].min
    },
    percent_vacation_used: ->(percent_vacation_used) {
      [percent_vacation_used, 100].max
    }
  }

  def initialize(entry)
    @entry = entry
  end

  def rating
    ATTR_TRANSFORMERS.reduce(0) do |weighted_rating, (attr, transform)|
      weighted_rating += transform.call(entry.public_send(attr)) * ATTR_WEIGHTS[attr]
    end.to_i
  end
end
