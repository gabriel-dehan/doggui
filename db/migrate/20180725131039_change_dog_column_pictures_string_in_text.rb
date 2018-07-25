class ChangeDogColumnPicturesStringInText < ActiveRecord::Migration[5.2]
  def change
  	change_column :dogs, :picture, :text
  end
end
