require 'rails_helper'

RSpec.describe OrderHistory, type: :model do
  before do
    @order_history = FactoryBot.build(:order_history)
  end

  describe '商品購入機能' do
    context '購入できる時' do
      it '全ての値が正しく入力されている' do
        expect(@order_history).to be_valid
      end
      it 'postal_codeに"ハイフン(-)"が含まれていれば購入できる' do
        @order_history.postal_code = '000-0000'
        expect(@order_history).to be_valid
      end
      it 'areaが2〜48なら購入できる' do
        @order_history.area = rand(2..48)
        expect(@order_history).to be_valid
      end
      it 'phone_nomberが11桁までの半角数字なら購入できる' do
        @order_history.phone_number = rand(0..99_999_999_999)
        expect(@order_history).to be_valid
      end
    end

    context '購入できない時' do
      it 'postal_codeが空では登録できない' do
        @order_history.postal_code = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'areaが空では登録できない' do
        @order_history.area = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalitiesが空では登録できない' do
        @order_history.municipalities = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'address_numberが空では登録できない' do
        @order_history.address_number = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Address number can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @order_history.phone_number = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'tokenが空では登録できない' do
        @order_history.token = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Token can't be blank")
      end
      it 'areaが1では購入できない' do
        @order_history.area = 1
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Area can't be blank")
      end
      it 'podtal_codeが"ハイフン(-)を含まないと保存できない"' do
        @order_history.postal_code = '0000000'
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'phone_numberが"ハイフン(-)"を含んでいると購入できない' do
        @order_history.phone_number = 'a000-0000'
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include('Phone number is invalid. Exclude hyphen(-)')
      end
      it 'user_idが空では登録できない' do
        @order_history.user_id = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("User can't be blank")
      end
      it 'product_idが空では登録できない' do
        @order_history.product_id = ''
        @order_history.valid?
        expect(@order_history.errors.full_messages).to include("Product can't be blank")
      end
    end
  end
end
