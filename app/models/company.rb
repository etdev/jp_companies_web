class Company < ApplicationRecord
  has_one :vorkers_entry
  has_one :en_hyouban_entry

  def weighted_rating
    ratings_sum = entries.reduce(0) do |avg_rating, entry|
      avg_rating + entry.weighted_rating
    end

    ratings_sum.fdiv(entries.count)
  end

  def entries
    @_entries ||= [vorkers_entry, en_hyouban_entry]
      .compact
  end
end
