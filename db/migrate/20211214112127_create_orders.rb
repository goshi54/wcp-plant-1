class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :cart_id
      t.integer :customer_id
      t.string :freight
      t.string :tax_price
      t.integer :item_id
      t.string :postal_code
      t.string :name
      t.string :address
      t.integer :cost
      t.integer :total_price
      t.integer :payment_way
      t.integer :status

      t.timestamps
    end
  end
end
