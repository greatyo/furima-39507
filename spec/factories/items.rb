FactoryBot.define do
  factory :item do
    name { Faker::String.random(length: 1..40) }
    explanation   { Faker::String.random(length: 1..1000) }
    category_id   { Faker::Number.within(range: 1..10) }
    situation_id { Faker::Number.within(range: 1..6) }
    delivery_charge_id { Faker::Number.within(range: 1..2) }
    region_id { Faker::Number.within(range: 1..47) }
    shipping_day_id { Faker::Number.within(range: 1..3) }
    price { Faker::Number.within(range: 300..9_999_999) }

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/penguin.png'), filename: 'penguin.png')
    end

    association :user
  end
end
