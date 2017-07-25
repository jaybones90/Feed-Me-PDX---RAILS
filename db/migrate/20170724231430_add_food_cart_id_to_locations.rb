class AddFoodCartIdToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :food_cart_id, :integer
  end
end
