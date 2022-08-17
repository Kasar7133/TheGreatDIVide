# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

GamePost.create(game_title: "Fallout", requested_number_of_players: 3, description: "A game about post-apocalyptic life.", user_id: 1)
GamePost.create(game_title: "Divinity", requested_number_of_players: 2, description: "A DND-type RPG where players make their own character", user_id: 3)
GamePost.create(game_title: "Dying Light", requested_number_of_players: 1, user_id: 2)
User.create(username: "Kasar7133", email: "beriosjosef1@gmail.com", password: "password")
User.create(username: "Geot", email: "ggtan@ggtan.net", password: "password")
User.create(username: "Beeb", email: "beeb@beeb.org", password: "password")
