class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @orders = Order.page(params[:page]).per(10).reverse_order
    #customer/showから偏移した場合は、:id keyを受け取ってcustomerの注文履歴だけを表示する
    @orders = Order.where(customer_id: params[:id]).page(params[:page]).per(10).reverse_order if params[:id].present?
  end
end
