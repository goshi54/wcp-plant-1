class AddNameKanaToCustomers < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :name_kana, :string
  end
end
