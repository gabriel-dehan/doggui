class ChangeDogColumnPrizeBooleanInText < ActiveRecord::Migration[5.2]
  def change
    change_column :dogs, :prize, :text
  end
end
