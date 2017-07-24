class CreateFoodCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :food_carts do |t|
      t.column :name, :string
      t.column :hours, :string
      t.column :owner_id, :integer
      
      t.timestamps
    end
  end
end
