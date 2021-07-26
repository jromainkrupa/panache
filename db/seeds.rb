# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

return if Rails.env.production?

p "model destruction..."
Sport.destroy_all
User.destroy_all
p "done!"


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
  Sport.create(name: sport[:name], image_url: sport[:image_url])
end

p "sports created : #{Sport.count}"