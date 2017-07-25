class CreateReply < ActiveRecord::Migration[5.1]
  def change
    create_table :replies do |t|
      t.column :body

      t.timestamps
    end
  end
end
