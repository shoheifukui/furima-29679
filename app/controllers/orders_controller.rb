class OrdersController < ApplicationController

  def index
    @order = Order.new
  end
 
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.permit(:purchase, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number)
  end
end