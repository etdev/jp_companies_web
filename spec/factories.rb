FactoryGirl.define do
  factory :en_hyouban_entry do
    sequence(:en_hyouban_id) { |n| "en_hyouban_id#{n}" }
    name { Faker::Name.name }
    average_salary { Faker::Number.between(32_000, 88000) }
    location { Faker::Address.city }
    sequence(:url) { |n| "https://en-hyouban.com/company/#{n}" }
    rating { Faker::Number.between(35, 95) }
    ratings_count { Faker::Number.between(5, 200) }
    daily_hours_worked { %w(7-8 8-9 9-10).sample }
    category { Faker::GameOfThrones.house }
  end
end
