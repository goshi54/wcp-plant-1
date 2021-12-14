class Public::HomesController < ApplicationController
  def top
    @item = Item.limit(4).order(created_at: :desc)
    @q = Item.ransack(params[:q])
  end

  def about
  end

end
