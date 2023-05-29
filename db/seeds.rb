# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Game.create(title: "Dota 2")
Product.create(name: "Skin Phantom Lancer", description: "Skin foda", price: 24.60, game_id: 1, user_id: 1)
Order.create(user_id: 2, product_id: 1)
