class AddExperienceToDogs < ActiveRecord::Migration[5.2]
  def change
   add_column :dogs, :experience, :boolean
  end
end
