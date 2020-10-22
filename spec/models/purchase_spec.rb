require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it 'クレジットカード番号、有効期限の年月、セキュリティコード、postal_code,prefecture_id,city,address,phone_numberが入力されていれば購入できる' do
        expect(@purchase).to be_valid
      end
      it '郵便番号を３桁と4桁の値の間に-を入力すれば購入できる' do
        @purchase.postal_code = '111-1111'
        expect(@purchase).to be_valid
      end
      it '電話番号はハイフンは不要で、11桁以内でなら購入できる' do
        @purchase.phone_number = '12345678911'
        expect(@purchase).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'tokenが空だと購入できない' do
        @purchase.token = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空だと購入できない' do
        @purchase.postal_code = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid')
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @purchase.postal_code = '1234567'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid")
      end
      it 'prefecture_idが空だと購入できない' do
        @purchase.prefecture_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Prefecture is not a number')
      end
      it 'cityが空だと購入できない' do
        @purchase.city = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できない' do
        @purchase.address = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @purchase.phone_number = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは11桁以上だと購入できない' do
        @purchase.phone_number = "1234567890111"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'phone_numberは11桁以内でも-が入っていると購入できない' do
        @purchase.phone_number = "123-4567-8900"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
    end
  end
end
