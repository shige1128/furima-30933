class OrdersController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @order_history = OrderHistory.new
  end

  def create
    @order_history = OrderHistory.new(order_params)
    if @order_history.valid?
      @order_history.save
      redirect_to root_path
    else
      @product = Product.find(params[:product_id])
      render :index
    end
  end

  private

  def order_params
    params.require(:order_history).permit(:postal_code, :area, :municipalities, :address_number, :building, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id])
  end

end
