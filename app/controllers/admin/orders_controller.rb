class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: params[:id])
    @order_total = 0
    @order_details.each do |o|
    @order_total += (o.price * o.quantity)
   end
  end


  def update
    @order = Order.find(params[:id])
    if @order.update(order_params) && @order.status == "confirmed"
        redirect_back fallback_location: admin_path, notice: '注文ステータス更新に伴い、制作ステータスを更新しました'
    elsif !@order.update(order_params)
        render :show
    else  redirect_back fallback_location: admin_path, notice: '注文ステータスを更新しました'
    end
  end

  private

  def order_params
    params.require(:order).permit(:customer_id,:postal_code,:address,:name,:cost,:total_price,:status)
  end
end
