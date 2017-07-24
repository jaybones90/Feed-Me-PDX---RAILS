class AddLocationIdToFoodCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :food_carts, :location_id, :integer
  end
end
