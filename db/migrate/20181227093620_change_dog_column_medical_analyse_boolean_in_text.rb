class ChangeDogColumnMedicalAnalyseBooleanInText < ActiveRecord::Migration[5.2]
  def change
    change_column :dogs, :medical_analyse, :text
  end
end
