class Company < ApplicationRecord
  has_one :vorkers_entry
  has_one :en_hyouban_entry

  validates :rating, presence: true, numericality: true

  def weighted_rating
    rating
  end

  def update_rating
    self.rating = entries.map(&:weighted_rating).reduce(0, :+)
      .fdiv(entries.count)

    save!
  end

  def self.by_rating
    order(rating: :desc)
  end

  private

  def entries
    @_entries ||= [vorkers_entry, en_hyouban_entry]
      .compact
  end
end
