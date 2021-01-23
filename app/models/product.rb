class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping
  belongs_to :area
  belongs_to :day

  belongs_to :user
  has_one_attached :image

  validates :image, :products_name, :text, :price, presence: true
  validates :products_name, length: { maximum: 40 }
  validates :text, length: { maximum: 1000 }
  validates :price, inclusion: { in: 300..9_999_999 }
  validates :category_id, :status_id, :area_id, :shipping_id, :days_id, numericality: { other_than: 1 }
  with_options presence: true do
    validates :price, format: { with: /\A[0-9]+\z/ }
  end
end
