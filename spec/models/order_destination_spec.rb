require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    item = FactoryBot.create(:item)
    user = FactoryBot.create(:user)
    @order_destination = FactoryBot.build(:order_destination, item_id: item.id, user_id: user.id)
    sleep(0.1)
  end


  describe '商品購入' do
    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_destination).to be_valid
      end
      it '建物名が空でも保存できる' do
        @order_destination.building_name = ""
        expect(@order_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'クレジットカード情報が空では保存できない' do
        @order_destination.token = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では保存できない' do
        @order_destination.postal_code = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_destination.postal_code = "1234567"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Postal code is invalid. Enter it as follows(e.g. 123-4567)")
      end
      it '都道府県名が「---」では保存できない' do
        @order_destination.prefecture_id = 1
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空では保存できない' do
        @order_destination.city = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できない' do
        @order_destination.address = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では保存できない' do
        @order_destination.phone_number = ""
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が11桁未満では保存できない' do
        @order_destination.phone_number = "0123456789"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is too short")
      end
      it '電話番号が数値でなければ保存できない' do
        @order_destination.phone_number = "０１２３４５６７８９０"
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
      it 'itemが紐付いていないと保存できない' do
        @order_destination.item_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("Item must exist")
      end
      it 'userが紐付いていないと保存できない' do
        @order_destination.user_id = nil
        @order_destination.valid?
        expect(@order_destination.errors.full_messages).to include("User must exist")
      end
    end
  end
end