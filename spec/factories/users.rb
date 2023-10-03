FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 5) }
    email                 { Faker::Internet.email }
    password              { 'aaa000' }
    password_confirmation { password }
    japanese_name = Gimei.name
    last_name             { japanese_name.last.kanji }
    first_name            { japanese_name.first.kanji }
    last_name_kana        { japanese_name.last.katakana }
    first_name_kana       { japanese_name.first.katakana }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2018-12-31') }
  end
end
