class OrdersController < ApplicationController
  before_action :transaction_params, only: [:index, :create]

  def index
    @purchase = Purchase.new
  end
 
  def create
    @purchase = Purchase.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:token, :transaction_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: transaction_params)
  end

  def transaction_params
    params.permit(:user_id, :item_id)
  end

end