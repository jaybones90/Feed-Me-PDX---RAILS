class AddToPhoneNumberToReplies < ActiveRecord::Migration[5.1]
  def change
    add_column :replies, :to_phone_number, :string
  end
end
