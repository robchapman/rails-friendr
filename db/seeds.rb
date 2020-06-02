# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#  "name" "description" "location" t.integer "price"
Friend.create(name: "A Mans Best Friend", description: "A loyal labrador who will fetch your paper and follow you around the house", location: "South Yarra", price: "30")
Friend.create(name: "Betty", description: "Grandma, she will knit you socks and bake you cakes", location: "Lovely Hill", price: "70")
Friend.create(name: "Marty", description: "The take anywhere friend. Great with parents, life of the party", location: "Heaven", price: "40")
