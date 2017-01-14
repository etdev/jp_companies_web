FactoryGirl.define do
  factory :en_hyouban_entry do
    sequence(:en_hyouban_id) { |n| n + 30_000 }
    name { Faker::Name.name }
    average_salary { Faker::Number.between(32_000, 88_000) }
    location { Faker::Address.city }
    sequence(:url) { |n| "https://en-hyouban.com/company/#{n}" }
    rating { Faker::Number.between(35, 95) }
    ratings_count do
      Faker::Number.between(
        EnHyoubanEntry::MIN_RATINGS_COUNT + 1,
        EnHyoubanEntry::MIN_RATINGS_COUNT + 100
      )
    end
    daily_hours_worked { %w(8-9 9-10 10-11).sample }
    category { Faker::GameOfThrones.house }
  end

  factory :vorkers_entry do
    sequence(:vorkers_id) { |n| "a0#{50_000 + n}" }
    name { Faker::Name.name }
    sequence(:url) do |n|
      "http://www.vorkers.com/company.php?m_id=#a0#{50_000 + n}"
    end
    rating { 5.0 - 2 * Faker::Number.decimal(0, 2).to_f }
    ratings_count do
      Faker::Number.between(
        VorkersEntry::MIN_RATINGS_COUNT + 1,
        VorkersEntry::MIN_RATINGS_COUNT + 100
      )
    end
    monthly_overtime { Faker::Number.between(30, 120) }
    percent_vacation_used { Faker::Number.decimal(2, 2) }
    category { Faker::GameOfThrones.house }
    thumbnail_url { "http://#{Faker::App.name}.thumbnails.example.com" }
    stock_info { Faker::StarWars.quote }
  end

  factory :company do
    name { Faker::Name.name }
    name_jp { "#{name}_日本語" }
    name_kana { "#{name}_にほんご" }
    employees_count { Faker::Number.between(5, 10_000) }
  end
end
