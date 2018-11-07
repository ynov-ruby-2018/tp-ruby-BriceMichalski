class MessagesMigration < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.timestamps
      t.text :content
      t.integer :user_id
    end
    create_table :likes do |t|
      t.timestamps
      t.integer :message_id
    end
    create_table :dislikes do |t|
      t.timestamps
      t.integer :message_id
    end
  end
end
