class AddIsReadToConversationMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :conversation_messages, :is_read, :boolean, default: false
  end
end
