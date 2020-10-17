class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :status_id, :price, :delivery_fee_id, :prefecture_id, :delivery_days_id, :image).merge(user_id: current_user.id)
  end
end