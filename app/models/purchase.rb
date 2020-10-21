class Purchase 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :token, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number

  with_options presence: true do
    VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/
    validates :postal_code, format: { with: VALID_POSTAL_CODE_REGEX }
    validates :city
    validates :address
    validates :phone_number, length: { maximum: 11 }
    validates :token, presence: true
    validates_numericality_of :prefecture_id, other_than: 0
  end

  def save
    purchase_history = PurchaseHistory.create(user_id: user_id, item_id: item_id)
    Order.create(purchase_history_id: purchase_history.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number)
  end
end