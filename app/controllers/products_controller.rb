class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy]
  before_action :set_product, only: [:show, :destroy]

  def index
    @products = Product.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def destroy
    if current_user.id == @product.user.id
      product.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:image, :products_name, :text, :category_id, :status_id, :shipping_id, :area_id, :day_id,
                                    :price).merge(user_id: current_user.id)
  end
end
