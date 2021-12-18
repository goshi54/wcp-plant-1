class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|

      t.timestamps
      t.text :comment
      t.string :title
      t.integer :customer_id
      t.integer :item_id
    end
  end
end
