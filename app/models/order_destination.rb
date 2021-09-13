class OrderDestination
  include ActiveModel::Model
  attr_accessor :postal_code,:prefecture_id, :city, :address, :building_name, :phone_number, :order_id, :user_id, :item_id, :token


  with_options presence: true do
    validates :token
    validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Enter it as follows(e.g. 123-4567)'}
    validates :city
    validates :address
  end
  
  validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}

  with_options presence: true do
    validates :phone_number, numericality: {only_integer: true, message: 'is invalid. Input only number'}, length: {minimum: 11, message: 'is too short'}
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    destination = Destination.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id) 
  end
end