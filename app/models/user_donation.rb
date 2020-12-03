class UserDonation
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal, :area_id, :home, :home_number, :building, :number, :token

  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id, numericality: { other_than: 1 }
    validates :home
    validates :home_number
    validates :number, format: {with: /\A\d{10,11}\z/ }
    validates :token
  end
  validate :building

  def save
    # お客様の情報を保存
    customer = Customer.create(user_id: user_id, item_id: item_id)
    # お客様の購入する際の情報を保存
    Address.create(postal: postal, area_id: area_id, home: home, home_number: home_number, building: building, number: number, customer_id: customer.id)
  end
end
