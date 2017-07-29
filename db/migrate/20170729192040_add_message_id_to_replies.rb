class AddMessageIdToReplies < ActiveRecord::Migration[5.1]
  def change
    add_column :replies, :message_id, :integer
  end
end
