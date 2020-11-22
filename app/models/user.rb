class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    # バリデーションの設定(空の文字列を保存させない為と一意性制約)
    validates :nickname,               presence: true
    validates :password,               presence: true, length: { minimum: 6 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :password_confirmation,  presence: true, length: { minimum: 6 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :first_name_kana,        presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } 
    validates :last_name_kana,         presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } 
    validates :first_name,             presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :last_name,              presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :birthday,              presence: true

    # アソシエーション
    has_many :products
    has_many :customers
    has_many :comments,    dependent: :destroy
end
