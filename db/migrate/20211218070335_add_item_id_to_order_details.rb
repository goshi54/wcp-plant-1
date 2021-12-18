class AddItemIdToOrderDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :order_details, :item_id, :integer
  end
end
