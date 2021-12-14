class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :cart_id
      t.integer :customer_id
      t.text :explanation
      t.string :item_name
      t.string :item_image
      t.string :price

      t.timestamps
    end
  end
end
