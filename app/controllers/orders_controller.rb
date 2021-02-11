class OrdersController < ApplicationController
  before_action :set_product, only: [:index, :create]

  def index
    @order_history = OrderHistory.new
  end

  def create
    @order_history = OrderHistory.new(order_params)
    if @order_history.valid?
      pay_product
      @order_history.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_history).permit(:postal_code, :area, :municipalities, :address_number, :building, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

end
