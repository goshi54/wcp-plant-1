class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|

      t.timestamps
      t.integer :item_id
      t.integer :order_id
      t.integer :price
      t.integer :quantity
    end
  end
end
