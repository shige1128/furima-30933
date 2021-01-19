class ProductsController < ApplicationController

  private

  def product_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
end
