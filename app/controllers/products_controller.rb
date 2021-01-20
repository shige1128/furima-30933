class ProductsController < ApplicationController
  def index
  end
  
  def new
    @product = Product.new
  end

  def create
  end

  private

  def product_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
end
