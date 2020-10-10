class ItemsController < ApplicationController
  
  def new
      @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :status_id, :price, :delivery_fee_id, :prefecture_id, :delivery_days_id, :user, :image)
  end
  
end
