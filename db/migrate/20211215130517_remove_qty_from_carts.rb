class RemoveQtyFromCarts < ActiveRecord::Migration[5.2]
  def change
    remove_column :carts, :qty, :string
  end
end
