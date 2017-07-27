class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.column :total_price, :decimal

      t.timestamps
    end
  end
end
