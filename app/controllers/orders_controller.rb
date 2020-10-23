class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :order_params, only: [:index, :create]

  def index
    if current_user.id == @item.user.id
      redirect_to root_path
    else
      @purchase_history = Purchase.new
    end
  end

  def create
    @purchase_history = Purchase.new(purchase_history_params)
    if @purchase_history.valid?
      pay_item
      @purchase_history.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_history_params
    params.require(:purchase).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_history_params[:token],
      currency: 'jpy'
    )
  end

  def order_params
    @item = Item.find(params[:item_id])
  end
end
