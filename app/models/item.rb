class Item < ApplicationRecord
  
  
  
  belongs_to :user
  
  #AcitveHashのアソシエーション
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :status
    belongs_to :shipping_fee
    belongs_to :prefecture
    belongs_to :scheduled_delivery
end
