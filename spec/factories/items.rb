FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters }
    information { Faker::Lorem.characters }
    category_id { Faker::Number.within(range: 2..11) }
    status_id { Faker::Number.within(range: 2..7) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    shipping_fee_id { Faker::Number.within(range: 2..3) }
    scheduled_delivery_id { Faker::Number.within(range: 2..4) }
    price { Faker::Number.within(range: 300..9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    association :user
  end
end
