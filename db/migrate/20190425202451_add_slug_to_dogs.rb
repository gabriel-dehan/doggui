class AddSlugToDogs < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :slug, :string
    add_index :dogs, :slug, unique: true
  end
end
