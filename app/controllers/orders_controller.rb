class OrdersController < ApplicationController
  before_action :transaction_params, only: [:index, :create]

  def index
    @purchase = Purchase.new
  end
 
  def create
    @purchase = Purchase.new(purchase_params)
    @item = Item.find(params[:item_id])
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def transaction_params
    params.permit(:user_id, :item_id)
  end

  def pay_item
    Payjp.api_key = ""
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end