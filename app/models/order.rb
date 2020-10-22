class Order < ApplicationRecord
  belongs_to :purchase_history
 
  attr_accessor :token
  validates :token, presence: true

end