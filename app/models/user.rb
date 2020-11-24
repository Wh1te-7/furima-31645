class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    # バリデーションの設定(空の文字列を保存させない為と一意性制約)
    with_options presence: true do
      validates :nickname
      with_options format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i} do
        validates :password
        validates :password_confirmation
      end
      with_options format: {with: /\A[ァ-ヶー－]+\z/} do
        validates :first_name_kana
        validates :last_name_kana
      end
      with_options format: {with: /\A[ぁ-んァ-ン一-龥]/} do
        validates :first_name
        validates :last_name
      end
      validates :birthday
    end

    # アソシエーション
    has_many :products
    has_many :customers
    has_many :comments,    dependent: :destroy
  end

  
