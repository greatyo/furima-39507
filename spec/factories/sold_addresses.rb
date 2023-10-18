FactoryBot.define do
  factory :sold_address do
    post_code { '123-4567' }
    region_id { Faker::Number.within(range: 1..47) }
    city { Gimei.address.city.kanji }
    street_address { '1-23-456' }
    building_name { 'てすとコーポ123V' }
    telephone { '0123456789' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
