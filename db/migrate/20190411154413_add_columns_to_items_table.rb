class AddColumnsToItemsTable < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :category_id, :integer
    add_column :items, :description, :string
  end
end
