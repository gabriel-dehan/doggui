# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "seeding one user"
12.times do 
  avatars = ["https://i.pinimg.com/originals/5e/ab/5b/5eab5b594e80c90edeaf93a83f086710.jpg","https://media.meltystyle.fr/article-1904819-thumb-f1384766839/ian-somerhalder-de-the-vampire-diaries-saison.jpg","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSK0AyoMVFBeLcXNqeuo7HRZfOUHvpEKas7s3ijTYSBbphhivukXQ","http://therockofrochester.com/files/2015/06/FarmerTanSteve2-630x472.jpg?w=630&h=472&q=75","https://i.pinimg.com/originals/10/fc/4c/10fc4cd2c98ee5b740be4f424ec9924c.jpg","https://files.newsnetz.ch/bildlegende/155481/1905963_pic_970x641.jpg"]
  user = User.create!(
	email: Faker::Internet.email,
	password: "azerty",
  avatar: avatars.sample

	)
end

p "user created, let's seed dogs"


12.times do
  addresses = ["la ville aubert, saint guinoux", "7 rue auguste barbier, saint guinoux", "75 avenue de flandres, croix", "5 rue d'alançon, paris", "1 rue des petits carreaux, paris", "Arc de triomphe, paris", "grand place, Lille", "84 rue benoit malon, Marseille", "place de l'étoile, Paris"]
  dog = Dog.new(
    nickname: Faker::Coffee.variety,
    size: Faker::Number.between(10, 150),
    breed: "brown",
    user: User.all.sample,
      pictures_array = ["dog1.jpg", "dog3.jpg", "dog4.jpg", "dog5.jpg", "dog6" ],
    picture: pictures_array.shuffle.sample,
    address: addresses.sample
    )
  dog.save
 end

 p "dog & user seeded"