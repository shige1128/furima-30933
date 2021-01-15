class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birthday,  presence: true
  with_options presence: true do
    validates :family_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "は、カタカナで入力して下さい" }
    validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: "は、'ひらがな'、'カタカナ'、'漢字'で入力して下さい" }
  end
end