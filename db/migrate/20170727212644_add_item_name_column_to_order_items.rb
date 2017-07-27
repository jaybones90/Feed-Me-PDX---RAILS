class AddItemNameColumnToOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :item_name, :string
    add_column :order_items, :price, :decimal
  end
end
