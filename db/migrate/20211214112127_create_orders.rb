class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :cart_id
      t.integer :customer_id
      t.string :freight
      t.string :tax_price
      t.integer :item_id

      t.timestamps
    end
  end
end
