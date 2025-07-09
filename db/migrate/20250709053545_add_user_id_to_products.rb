class AddUserIdToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :user_id, :string
    add_column :users, :product_id, :string
  end
end
