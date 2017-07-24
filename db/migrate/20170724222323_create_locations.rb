class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.column :address, :string
      t.column :city, :string
      t.column :state, :string
      t.column :zip, :integer
      t.column :pod, :string, default: nil
    end
  end
end
