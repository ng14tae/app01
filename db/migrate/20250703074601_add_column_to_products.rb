class AddColumnToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :url, :string
  end
end
