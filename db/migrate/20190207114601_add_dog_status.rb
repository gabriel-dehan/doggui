class AddDogStatus < ActiveRecord::Migration[5.2]
  def change
    add_column :dogs, :status, :string
  end
end
