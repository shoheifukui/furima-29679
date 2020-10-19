class ItemsController < ApplicationController

before_action :set_item, only: [:edit, :update]
before_action :move_to_index, except: [:index, :show, :new, :create]

  def index
    @item = Item.all.order('created_at DESC')
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :status_id, :price, :delivery_fee_id, :prefecture_id, :delivery_day_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @item.user_id 
    redirect_to root_path
    end
  end
end

