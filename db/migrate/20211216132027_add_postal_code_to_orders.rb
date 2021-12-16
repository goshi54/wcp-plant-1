class AddPostalCodeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :postal_code, :string
  end
end
