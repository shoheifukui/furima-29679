FactoryBot.define do
  factory :item do
    association :user

    name              { Faker::String.random(length: 1..40) }
    detail            { Faker::String.random(length: 1..1000) }
    price             { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id       { 1 }
    status_id         { 1 }
    delivery_fee_id   { 1 }
    prefecture_id     { 1 }
    delivery_days_id  { 1 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
