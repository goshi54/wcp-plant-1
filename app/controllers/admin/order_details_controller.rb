class Admin::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_details_params)
    #自動更新①
    Order.find(@order_detail.order_id).update(status: 2) if @order_detail.create_status == 2
    #自動更新②
    @order_details = OrderDetail.where(order_id: @order_detail.order_id).pluck(:create_status)
    Order.find(@order_detail.order_id).update(status: 3) if @order_details.all?(3)
    redirect_back fallback_location: admin_path, notice: 'ステータスを更新しました'
  end


  private

  def order_details_params
    params.require(:order_detail).permit(:create_status)
  end
end
