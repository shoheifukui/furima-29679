class ItemsController < ApplicationController
  def new
      @items = Items.all
  end
end
