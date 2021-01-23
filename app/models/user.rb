class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :users
  has_one_attached :image

  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday, presence: true
  with_options presence: true do
    validates :family_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龠々]/ }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i }
  end
end
