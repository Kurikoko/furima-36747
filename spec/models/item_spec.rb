require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品の出品ができる場合' do
      it 'image, name, infomation, category_id, status_id, prefecture_id, shipping_fee_id, scheduled_delivery_id, priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end

      it 'categoryの選択が2項目以降であれば出品できる' do
        another_item = @item if @item.category_id >= 2
        expect(another_item).to be_valid
      end
      it 'statusの選択が2項目以降であれば出品できる' do
        another_item = @item if @item.status_id >= 2
        expect(another_item).to be_valid
      end
      it 'prefectureの選択が2項目以降であれば出品できる' do
        another_item = @item if @item.prefecture_id >= 2
        expect(another_item).to be_valid
      end
      it 'shipping_feeの選択が2項目または3項目めであれば出品できる' do
        another_item = @item if @item.shipping_fee_id == 2 || @item.shipping_fee_id == 3
        expect(another_item).to be_valid
      end
      it 'scheduled_deliveryの選択が2項目以降であれば出品できる' do
        another_item = @item if @item.scheduled_delivery_id >= 2
        expect(another_item).to be_valid
      end

      it 'priceが300円以上かつ9999999円以下かつ半角数字であれば出品できる' do
        another_item = @item if @item.price >= 300 && @item.price <= 9_999_999 && @item.price.is_a?(Integer)
        expect(another_item).to be_valid
      end
    end

    context '商品の出品ができない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infomationが空では出品できない' do
        @item.information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end

      it 'categoryが「---」では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'statusが「---」では出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it 'shipping_feeが「---」では出品できない' do
        @item.shipping_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee can't be blank")
      end

      it 'prefectureが「---」では出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'scheduled_deliveryが「---」では出品できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled delivery can't be blank")
      end

      it 'priceが空では登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字以外では出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width caracters')
      end
      it 'priceが299円以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが10,000,000円以上では出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end
