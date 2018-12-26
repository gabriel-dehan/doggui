class CreateConversationMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :conversation_messages do |t|
      t.references :conversation, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.text :content

      t.timestamps
    end
  end
end
