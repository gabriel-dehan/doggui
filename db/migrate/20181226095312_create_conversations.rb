class CreateConversations < ActiveRecord::Migration[5.2]
  def change
    create_table :conversations do |t|
      t.references :dog, foreign_key: true, index: true

      t.timestamps
    end
  end
end
