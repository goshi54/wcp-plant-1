class RemovePostalCodeFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :postal_code, :string
  end
end
