class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.references :user, foreign_key: true
      t.string :breed
      t.date :birthday_date
      t.string :lof_number
      t.string :color
      t.string :hair
      t.integer :size
      t.string :picture
      t.string :video
      t.string :nickname
      t.string :medical_analyse
      t.string :father_lof
      t.string :mother_lof
      t.string :prize
      t.text :description
      t.integer :price

      t.timestamps
    end
  end
end
