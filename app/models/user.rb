class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, uniqueness: true, length: { minimum: 6 }, format: { with: VALID_EMAIL_REGEX }
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX, confirmation: true, with: /\A[a-zA-Z0-9]+\z/ }

  with_options presence: true do
    validates :nickname
    validates :birth_day
    VALID_FULL_WIDTH_CHARACTOR_REGEX = /\A[一-龥]+\z/.freeze
    validates :family_name, format: { with: VALID_FULL_WIDTH_CHARACTOR_REGEX, message: 'Full-width characters' }
    validates :first_name, format: { with: VALID_FULL_WIDTH_CHARACTOR_REGEX, message: 'Full-width characters' }
    VALID_FULL_WIDTH_KATAKANA_CHARACTOR_REGEX = /\A[ァ-ヶー－]+\z/.freeze
    validates :family_name_kana, format: { with: VALID_FULL_WIDTH_KATAKANA_CHARACTOR_REGEX, message: 'Full-width katakana characters' }
    validates :first_name_kana, format: { with: VALID_FULL_WIDTH_KATAKANA_CHARACTOR_REGEX, message: ' Full-width katakana characters' }
  end
end
