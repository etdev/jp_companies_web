module WeightedRating
  class EnHyouban
    def initialize(entry)
      @entry = entry
    end

    def rating
      ATTR_TRANSFORMERS.reduce(0) do |weighted_rating, (attr, transform)|
        weighted_rating += transform.call(entry[attr]) * ATTR_WEIGHTS[attr]
      end.to_i
    end

    private

    attr_reader :entry

    ATTR_WEIGHTS = {
      rating: 0.5,
      average_salary: 0.2,
      ratings_count: 0.15,
      daily_hours_worked: 0.15,
    }

    ATTR_TRANSFORMERS = {
      rating: ->(rating) { rating },
      average_salary: ->(average_salary) { [average_salary.fdiv(10), 100].min },
      ratings_count: ->(ratings_count) {
        if ratings_count < EnHyoubanEntry::MIN_RATINGS_COUNT
          0
        else
          [ratings_count, 100].min
        end
      },
      daily_hours_worked: ->(daily_hours_worked) {
        case daily_hours_worked
        when "8-9" then 80
        when "9-10" then 60
        when "10-11" then 40
        end
      },
    }
  end
end
