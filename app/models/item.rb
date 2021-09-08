class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  # AcitveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :shipping_fee
    belongs_to :prefecture
    belongs_to :scheduled_delivery

  # Validations
  with_options presence: true do
    validates :image
    validates :name
    validates :information
    validates :price
  end

  validates :price, inclusion: {in: 300..9999999, message: "is out of setting range"},
   numericality: { only_integer: true, message: "is invalid. Input half-width caracters"}

  with_options numericality: { other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

end
