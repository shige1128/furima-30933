class Product < ApplicationRecord
  belongs_to :user

  validates :image, :products_name, :text, :category_id, :status_id, :shipping_id, :area_id, :days_id, :price_id, presence: true
  validates :products_name, length: { maximum: 40 }
  validates :text, length: { maximum: 1000 }
  validates :price, inclusion: { in: 300..9999999 }
  with_options presence: true do
    validates :price, format: { /\A[0-9]+\z/}
  end
end
