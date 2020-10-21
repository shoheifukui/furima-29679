require 'rails_helper'

RSpec.describe PurchaseHistory, type: :model do
  describe '商品購入機能' do
  
  context '商品購入がうまくいくとき' do
    it '' do
    end
  end

  context '商品購入がうまくいかないとき' do   
  end
end


describe '商品出品機能' do
  before do
    @item = FactoryBot.build(:item)
  end

  context '商品出品がうまくいくとき' do
    it 'image,namem,detail,price,category_id,status_id,delivery_fee_id,prefecture_id,delivery_days_idが存在すれば商品出品できる' do
      expect(@item).to be_valid
    end
    it 'priceの範囲が、¥300~¥9,999,999の間であれば商品出品できる' do
      @item.price = 1000
      expect(@item).to be_valid
    end
    it 'priceが半角数字であれば商品出品できる' do
      @item.price = 100_000
      expect(@item).to be_valid
    end
  end

  context '商品出品がうまくいかないとき' do
    it 'imageが空だと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end