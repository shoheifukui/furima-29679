class Item < ApplicationRecord
  
  belongs_to :user
  has_one_attached :image


  with_options presence: true do
    validates :image
    validates :name, length: {maximum: 40}
    validates :detail, length: {maximum: 1000}
    validates :user
    validates :price, numericality: {:greater_than_or_equal_to => 300, :less_than_or_equal_to => 9999999, message: " is out of setting range. Price must be Half-width number"}
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :status
    belongs_to_active_hash :delivery_fee
    belongs_to_active_hash :prefecture
    belongs_to_active_hash :delivery_day

    with_options presence: true do
      validates :category_id, inclusion: {in: 1..10, message: "Select"}
      validates :status_id, inclusion: {in: 1..6, message: "Select"}
      validates :delivery_fee_id, inclusion: {in: 1..2, message: "Select"}
      validates :prefecture_id, inclusion: {in: 1..47, message: "Select"}
      validates :delivery_days_id, inclusion: {in: 1..3, message: "Select"}
    end
end
