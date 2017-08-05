class AddSubscriberIdToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :subscriber_id, :integer
    remove_column :messages, :from_number
  end
end
