require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '出品できる時' do
      it 'image, products_name, text, category_id, status_id, shipping_id, area_id, days_id, priceが存在すれば出品できる' do
        expect(@product).to be_valid
      end
    end

    context '出品できない時' do
      it 'imageが空だと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'products_nameが空だと出品できない' do
        @product.products_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Products name can't be blank")
      end
      it 'textが空だと出品できない' do
        @product.text = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが1だと出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Category must be other than 1')
      end
      it 'status_idが1だと出品できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Status must be other than 1')
      end
      it 'shipping_idが1だと出品できない' do
        @product.shipping_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Shipping must be other than 1')
      end
      it 'area_idが1だと出品できない' do
        @product.area_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Area must be other than 1')
      end
      it 'days_idが1だと出品できない' do
        @product.days_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include('Days must be other than 1')
      end
      it 'priceが空だと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが半角数字でないと出品できない' do
        @product.price = 'eigo'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceは299円以下では出品できない' do
        @product.price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not included in the list')
      end
      it 'priceは10,000,000以上では出品できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not included in the list')
      end
    end
  end
end
