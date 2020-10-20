class Purchase < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number

    validates :token, presence: true

  with_options presence: true do
    VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
    validates :postal_code, format: { with: VALID_POSTAL_CODE_REGEX }
    validates :city
    validates :address
    validates :phone_number, length: { maximum: 11 }
  end

  def save
    transaction = Transaction.create(user_id: user_id, item_id: item_id)
    Order.create(transaction_id: transaction.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end