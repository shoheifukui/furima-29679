class Order < ApplicationRecord

  belongs_to :purchase

  with_options presence: true do
    validates :purchase
    VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
    validates :postal_code, format: { with: VALID_POSTAL_CODE_REGEX }
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, length: { maximum: 11 }
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :prefecture_id, inclusion: { in: 1..47, message: 'Select' }
  end
end