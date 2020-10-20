class Order < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :prefecture_id, inclusion: { in: 1..47, message: 'Select' }
  end
end