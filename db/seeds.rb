# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# return if Rails.env.production?

p "model destruction..."
Event.destroy_all
ClubSport.destroy_all
Club.destroy_all
Sport.destroy_all
User.destroy_all
p "done!"

frank = User.create!(
  {
    first_name:    'Frank',
    last_name:     'Mbatang',
    email:         'admin@admin.com',
    phone_number:  '0695500784',
    password:      'azerty',
  })

sports = [
  {
    name: "Arts martiaux",
    image_url: "https://images.unsplash.com/photo-1476525223214-c31ff100e1ae?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80"
  },
  {
    name: "Natation",
    image_url: "https://images.unsplash.com/photo-1622629797619-c100e3e67e2e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2689&q=80"
  },
  {
    name: "Equitation",
    image_url: "https://images.unsplash.com/photo-1600715150567-e46cb820f1ef?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80"
  },
  {
    name: "Escrime",
    image_url: "https://images.unsplash.com/photo-1487491491904-a48f73cd4078?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80"
  },
]

sports.each do |sport|
  Sport.create!(name: sport[:name], image_url: sport[:image_url])
end

p "sports created : #{Sport.count}"

events = [
  {
    name: "color obstacle rush",
    description: "Envie de passer une journée sportive, colorée, fun et en musique ? Alors n'hésitez plus et participez à la Color Obstacle Rush ! Ce sont 5km, 20 obstacles, 6 stations de couleurs, 20 zones de musique, de la mousse et un échauffement déjanté. Que vous soyez seul ou avec votre team, c'est un moment inoubliable assuré. Inscription et informations complémentaires sur le site de la Color Obstacle Rush, inscription obligatoire et payante (entre 32,50€ et 47,50€).",
    start_date: Time.zone.now + 1.hour,
    end_date: Time.zone.now + 1.day,
    address: "1-57 avenue de Bohlen",
    postal_code: "69120",
    city: "Lyon",
    sport: Sport.first,
    price: 30,
    is_free: false,
    website: "toto.com",
    organizer: frank,
    image_url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.obstacle-mag.com%2F2018%2F12%2F01%2Fcolor-obstacle-rush-2019%2F&psig=AOvVaw1y91huzYBQBwcMzr3irGKd&ust=1627400114700000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMi38YCIgfICFQAAAAAdAAAAABAD"
  },
  { 
    name: "Tournoi de tennis",    
    description: "Envie de passer une journée sportive, colorée, fun et en musique ? Alors n'hésitez plus et participez à la Color Obstacle Rush ! Ce sont 5km, 20 obstacles, 6 stations de couleurs, 20 zones de musique, de la mousse et un échauffement déjanté. Que vous soyez seul ou avec votre team, c'est un moment inoubliable assuré. Inscription et informations complémentaires sur le site de la Color Obstacle Rush, inscription obligatoire et payante (entre 32,50€ et 47,50€).",
    address: "18 rue du repos",
    city:  "Genas",
    postal_code:  "69809",
    start_date:  Time.zone.now + 2.day,
    end_date:  Time.zone.now + 3.day,
    sport: Sport.second, 
    is_free: true,
    website: "tata.com",
    organizer: frank,
    image_url: "https://images.unsplash.com/photo-1554068865-24cecd4e34b8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dGVubmlzfGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60"
  }
]

events.each do |event|
  Event.create!(event)
end
p "Events created : #{Event.count}"


clubs = [
  {
    name: "tennis club",
    address: "1-57 avenue de Bohlen",
    postal_code: "69120",
    city: "Genas",
    website: "toto.com",
    admin: frank,
    image_url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.obstacle-mag.com%2F2018%2F12%2F01%2Fcolor-obstacle-rush-2019%2F&psig=AOvVaw1y91huzYBQBwcMzr3irGKd&ust=1627400114700000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMi38YCIgfICFQAAAAAdAAAAABAD"
  },
  {
    name: "football club",
    address: "1-57 avenue de Bohlen",
    postal_code: "69120",
    city: "Genas",
    website: "toto.com",
    admin: frank,
    image_url: "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.obstacle-mag.com%2F2018%2F12%2F01%2Fcolor-obstacle-rush-2019%2F&psig=AOvVaw1y91huzYBQBwcMzr3irGKd&ust=1627400114700000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCMi38YCIgfICFQAAAAAdAAAAABAD"
  },

]

clubs.each do |club|
  Club.create!(club)
end
p "Clubs created : #{Club.count}"

Club.all.each do |club|
  ClubSport.create(club: club, sport: Sport.first)
end
p "ClubSports created : #{ClubSport.count}"
