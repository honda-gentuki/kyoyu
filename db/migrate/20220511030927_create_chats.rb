class CreateChats < ActiveRecord::Migration[6.0]
  def change
    create_table :chats do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.text :message
      t.boolean :checked, default: false, null: false
      t.timestamps
    end
  end
end
