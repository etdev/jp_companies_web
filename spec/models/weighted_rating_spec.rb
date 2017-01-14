require "rails_helper"

RSpec.describe "weighted_rating" do
  context "vorkers" do
    it "generates numerical rating from entry" do
      entry = create(:vorkers_entry)

      weighted_rating = WeightedRating::Vorkers.new(entry).rating

      expect(weighted_rating).to be_between(0, 100)
    end
  end

  context "en_hyouban" do
    it "generates numerical rating from entry" do
      entry = create(:en_hyouban_entry)

      weighted_rating = WeightedRating::EnHyouban.new(entry).rating

      expect(weighted_rating).to be_between(0, 100)
    end
  end
end
