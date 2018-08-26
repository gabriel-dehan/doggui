class ChangePrizeToBeIntegerInDogs < ActiveRecord::Migration[5.2]
  def change
    change_column :dogs, :prize, :integer, default: 0
  end
end

  #   Dogs.each do |dog|
  #     if dog.prize != nil
  #   return
  #     dog.prize = 1
  #   end
  # end


