class AddPaymentWayToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :payment_way, :integer
  end
end
