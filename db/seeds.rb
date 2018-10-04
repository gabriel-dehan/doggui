# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "seeding one user"

  User.create!(
     email: "guillaume.aa@gmail.com",
     password: "azerty"
  )

  User.create!(
    email: "yannleost@gmail.com",
    password: "azerty"
  )



p "user created, let's seed dogs"


 12.times do

  images = ['https://static.wamiz.fr/images/animaux/chiens/large/chien-du-groenland.jpg', 'http://s1.lprs1.fr/images/2017/07/25/7154985_1-0-1720309962_1000x625.jpg', 'https://www.wikichien.fr/wp-content/uploads/sites/4/quand-chien-devient-vieux.jpg', 'https://static.ladepeche.fr/content/media/image/zoom/2011/07/19/201107191348.jpg', 'https://static.wamiz.fr/images/articles/facebook/article/chien-obese-fb-593fe8ba700e4.jpg', 'http://www.votre-chien.com/wp-content/uploads/2016/05/assurance-chien-1-696x385.jpg',
    'https://static.lexpress.fr/medias_10954/w_2048,h_1146,c_crop,x_0,y_341/w_640,h_360,c_fill,g_north/v1464890691/berger-allemand-chien-meilleur-ami-de-l-homme-licence-sans-soucis_5608599.jpg', 'https://media.ooreka.fr/public/image/3-306113-4041-full-13118833.jpg', 'https://jardinage.lemonde.fr/images/dossiers/2017-12/chien-104208.jpg', 'https://www.comment-dresser-son-chien.com/wp-content/uploads/2017/11/eduquer-son-chien.jpg', 'https://o.aolcdn.com/images/dims3/GLOB/legacy_thumbnail/630x315/format/jpg/quality/85/http%3A%2F%2Fi.huffpost.com%2Fgen%2F4394764%2Fimages%2Fn-CHIEN-ROUX-YEUX-BLEUS-628x314.jpg',
    'https://www.purina.fr/sites/g/files/mcldtz1371/files/2018-02/20_1_0.jpg', 'https://www.drostatic.com/images/lemagfemmes/home/chien.jpg', 'https://www.jura.ch/Htdocs/Images/Pictures/5789.JPG?puid=0013f967-6023-4a27-98c1-725e0cd192eb']
  version = ["Nain", "Standart", "kaninchen"]
  picture_url = "chien11.jpeg"
  price = ["150", "200", "169", "99", "345" ]
  addresses = ["goncourt, paris", "sentier, paris", "madelaine, paris", "7 rue auguste barbier, paris", "5 rue d'alançon, paris", "1 rue des petits carreaux, paris", "Arc de triomphe, paris", "Tour effeil, paris", "place de l'étoile, Paris"]

  dog = Dog.new(
    nickname: Faker::Dog.name,
    remote_picture_url: images.shuffle.sample,
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
