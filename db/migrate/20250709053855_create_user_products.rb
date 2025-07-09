class CreateUserProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :user_products do |t|
      t.string :user_id
      t.string :products_id
      t.timestamps
    end
  end
end
