class AddSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribers do |t|
      t.column :from_number, :string

      t.timestamps
    end
  end
end
