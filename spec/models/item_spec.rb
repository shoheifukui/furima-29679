require 'rails_helper'

RSpec.describe Item, type: :model do
  
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品がうまくいくとき' do
      it "image,namem,detail,price,category_id,status_id,delivery_fee_id,prefecture_id,delivery_days_idが存在すれば商品出品できる" do
        expect(@item).to be_valid
      end
      it "priceの範囲が、¥300~¥9,999,999の間であれば商品出品できる" do
        @item.price = 1000
        expect(@item).to be_valid
      end
      it "priceが半角数字であれば商品出品できる" do
        @item.price = 100000
        expect(@item).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "nameが空だと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it "detailが空だと登録できない" do
        @item.detail = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail can't be blank")
      end
      it "priceが空だと登録できない" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "category_idを選択していないと登録できない" do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      it "status_idを選択していないと登録できない" do
        @item.status_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end
      it "delivery_fee_idを選択していないと登録できない" do
        @item.delivery_fee_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee Select")
      end
      it "prefecture_idを選択していないと登録できない" do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture Select")
      end
      it "delivery_days_idを選択していないと登録できない" do
        @item.delivery_days_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days Select") 
      end
      it "priceが、¥300~¥9,999,999の範囲外であれば商品出品できない" do
        @item.price = 1000000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price  is out of setting range. Price must be Half-width number")
      end
      it "priceが半角数字以外なら商品出品できない" do
        @item.price = "AAA"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price  is out of setting range. Price must be Half-width number")
      end
    end
  end
end
