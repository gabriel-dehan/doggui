class ChangeBreedColumnNameAndType < ActiveRecord::Migration[5.2]
  def change
    remove_column :dogs, :breed, :string
    add_reference :dogs, :breed, foreign_key: true, index: true
  end
end
