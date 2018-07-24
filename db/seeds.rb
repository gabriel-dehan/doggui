# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "seeding one user"
10.times do 
  user = User.create!(
	email: Faker::Internet.email,
	password: "azerty",

	)
end

p "user created, let's seed dogs"


10.times do
  dog = Dog.create!(
    nickname: Faker::Coffee.variety,
    size: Faker::Number.between(10, 150),
    breed: "brown",
    user: User.all.sample,
    address: Faker::Address.full_address
    )
 end

 p "dog & user seeded"