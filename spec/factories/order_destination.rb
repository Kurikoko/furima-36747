FactoryBot.define do
  factory :order_destination do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city { Gimei.city.kanji }
    address { '1-1-1' }
    building_name { '建物名' }
    phone_number { Faker::PhoneNumber.subscriber_number(length: 11) }
  end
end
