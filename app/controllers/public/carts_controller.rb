class Public::CartsController < ApplicationController
   before_action :authenticate_customer!

  def index
    @carts = current_customer.carts
    # カートに入ってる商品の合計金額
    @total = @carts.inject(0) { |sum, item| sum + (item.sum_of_price*1.1) }
  end

  def destroy_all
    items = current_customer.carts
    items.destroy_all
    redirect_to carts_path
  end

  def destroy

    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path
  end

  def update
    @cart = Cart.find(params[:id])
    @cart.update(cart_params)
    redirect_to carts_path
  end


  def create
      @carts = current_customer.carts
      @cart = Cart.new(cart_params)
      if current_customer.carts.find_by(item_id: params[:cart][:item_id]).present?
        add_item = current_customer.carts.find_by(item_id: params[:cart][:item_id])
        add_item.quantity += params[:cart][:quantity].to_i
        add_item.save
        redirect_to carts_path
      else @cart.save
        redirect_to carts_path
      end
  end

  private

  def cart_params
    params.require(:cart).permit(:quantity, :customer_id, :item_id )
  end
end
