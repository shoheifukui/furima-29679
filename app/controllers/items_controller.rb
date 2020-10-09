class ItemsController < ApplicationController
  def destroy
  end
  
  def new
      @items = Item.all
  end
end
