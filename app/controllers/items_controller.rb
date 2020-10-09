class ItemsController < ApplicationController
  
  def index
  end
    
  def new
      @items = Item.new
  end
  
  def destroy
  end

  def create
  end

  private

end
