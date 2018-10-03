# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "seeding one user"

 12.times do

  version = ["Nain", "Standart", "kaninchen"]
  picture_url = "chien11.jpeg"
  price = ["150", "200", "169", "99", "345" ]
  addresses = ["goncourt, paris", "sentier, paris", "madelaine, paris", "7 rue auguste barbier, paris", "5 rue d'alançon, paris", "1 rue des petits carreaux, paris", "Arc de triomphe, paris", "Tour effeil, paris", "place de l'étoile, Paris"]

  dog = Dog.new(
    nickname: Faker::Dog.name,
    picture: picture_url,
    size: Faker::Number.between(10, 150),
    breed: Faker::Dog.breed,
    user: User.all.sample,
    version: version.shuffle.sample,
    address: addresses.shuffle.sample,
    price: price.shuffle.sample,
    )
  dog.save
 end

 p "dog & user seeded"
