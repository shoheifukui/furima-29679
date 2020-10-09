class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name, length: {maximum: 40}
    validates :detail, length: {maximum: 1000}
    validates :category_id
    validates :status_id
    validates :price, length: {minimum: 300, maximum: 9999999}, format: { with: /\A[0-9]+\z/ }
    validates :delivery_fee_id
    validates :region_id
    validates :delivery_days_id
    validates :user
  end
end
