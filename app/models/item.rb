class Item < ApplicationRecord
  belongs_to :user
  
  # AcitveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :shipping_fee
    belongs_to :prefecture
    belongs_to :scheduled_delivery

  # Validations
  with_options numericality: { other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  with_options presence: true do
    validates :name
    validates :information
    validates :price
  end

  validates :price, numericality: {in: 300..9999999, message: "is out of setting range"}, 
    format: { with: /\d/, message: "is invalid. Input half-width caracters"}

end
