class Public::ItemsController < ApplicationController

  def index
    @items = Item.page(params[:page]).reverse_order
    @items_all = Item.all
    @q = Item.ransack(params[:q])
  end


  def show
    @item = Item.find(params[:id])
    @cart = Cart.new
    @q = Item.ransack(params[:q])
  end
end
