FactoryBot.define do
  factory :item do
    name { Faker::Types.rb_string(max_length: 40) }
    information { Faker::Types.rb_string(max_length: 1000) }
    category_id { Faker::Number.between(from: 2, to: 11) }
    status_id { Faker::Number.between(from: 2, to: 7) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    shipping_fee_id { Faker::Number.between(from: 2, to: 3) }
    scheduled_delivery_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9999999) }

    afeter(:build) do |item|
      item.image.attach(io.File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
