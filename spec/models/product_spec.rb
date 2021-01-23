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
      it 'products_nameが1〜40文字なら出品できる' do
        @product.products_name = "1"
        expect(@product).to be_valid
      end
      it 'textが1〜1000文字なら出品できる' do
        @product.text = "1"
        expect(@product).to be_valid
      end
      it 'category_idが1でなければ出品できる' do
        @product.category_id = rand(2..17)
        expect(@product).to be_valid
      end
      it 'status_idが1でなければ出品できる' do
        @product.status_id = rand(2..9)
        expect(@product).to be_valid
      end
      it 'shipping_idが1でなければ出品できる' do
        @product.shipping_id = rand(2..3)
        expect(@product).to be_valid
      end
      it 'area_idが1でなければ出品できる' do
        @product.area_id = rand(2..48)
        expect(@product).to be_valid
      end
      it 'days_idが1でなければ出品できる' do
        @product.days_id = rand(2..4) 
        expect(@product).to be_valid
      end
      it 'priceが半角数字なら保存できる' do
        @product.price = 3000
        expect(@product).to be_valid
      end
      it 'priceの数値が300〜9999999なら出品できる' do
        @product.price = rand(300..9999999)
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
        @product.products_name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Products name can't be blank")
      end
      it 'textが空だと出品できない' do
        @product.text = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが空だと出品できない' do
        @product.category_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空だと出品できない' do
        @product.status_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end
      it 'shipping_idが空だと出品できない' do
        @product.shipping_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping can't be blank")
      end
      it 'area_idが空だと出品できない' do
        @product.area_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Area can't be blank")
      end
      it 'days_idが空だと出品できない' do
        @product.days_id = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Days can't be blank")
      end
      it 'priceが空だと出品できない' do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
    end
  end
end
