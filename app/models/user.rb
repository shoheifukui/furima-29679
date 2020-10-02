class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
   
   with_options presence: true do
   validates :nickname
   validates :email, format: {uniqueness: true, length: {minimum: 6}, with: VALID_EMAIL_REGEX, message: "メールアドレスに@を含んでください。「#{email}」内に「@」がありません"}
   validates :encrypted_password, format: {confirmation: true, with:/\A[a-zA-Z0-9]+\z/}
   validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
   validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/}
   validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
   validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
   validates :birth_day

end