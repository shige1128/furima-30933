class OrderHistory
  include ActiveModel::Model
  attr_accessor :postal_code, :area, :municipalities, :address_number, :building, :phone_number, :user_id, :product_id, :token

  validates :municipalities, :address_number, :token, :user_id, :product_id, presence: true
  validates :area, numericality: { other_than: 1, message: "can't be blank" }
  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :phone_number, format: { with: /\A\d{1,11}\z/, message: 'is invalid. Exclude hyphen(-)' }
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, area_id: area, municipalities: municipalities, address_number: address_number,
                   building: building, phone_number: phone_number, order_id: order.id)
  end
end
