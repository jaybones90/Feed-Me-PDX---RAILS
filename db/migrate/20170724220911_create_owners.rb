class CreateOwners < ActiveRecord::Migration[5.1]
  def change
    create_table :owners do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.column :email, :string
      t.column :phone_number, :string

      t.timestamps
    end
  end
end
