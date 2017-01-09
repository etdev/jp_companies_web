require "rails_helper"

RSpec.describe "vorkers_weighted_rating" do
  it "generates numerical rating from vorkers entry" do
    entry = create(:vorkers_entry)

    weighted_rating = VorkersWeightedRating.new(entry).rating

    expect(weighted_rating).to be_between(0, VorkersWeightedRating::MAX_RATING)
  end
end
