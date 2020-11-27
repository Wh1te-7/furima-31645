class Item < ApplicationRecord
  belongs_to :user
  has_one :customer
  has_many :comments
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  with_options presence: true do
    validates :title
    validates :concept
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :status_id
      validates :delivery_id
      validates :area_id
      validates :day_id
    end
    validates :price, 
    numericality: { 
      greater_than_or_equal_to: 300, 
      less_than_or_equal_to: 9999999
    }, 
    format: {
      with: /\A[-]?[0-9]+(\.[0-9]+)?\z/
    }
    validates :image
  end
end
