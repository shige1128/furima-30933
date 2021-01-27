class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :destroy, :edit, :update]
  before_action :set_product, only: [:show, :destroy, :edit, :update]

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
      @product.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def edit
    redirect_to root_path unless current_user.id == @product.user.id
  end

  def update
    if current_user.id == @product.user_id
      @product.update(product_params)
      redirect_to action: :show
    else
      render :edit
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
