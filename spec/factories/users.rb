FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.username }
    email { Faker::Internet.free_email }
    password { 'a1' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    last_name { Gimei.last.kanji }
    first_name { Gimei.first.kanji }
    last_name_kana { Gimei.last.katakana }
    first_name_kana { Gimei.first.katakana }
    birthday { Faker::Date.in_date_period }
  end
end
