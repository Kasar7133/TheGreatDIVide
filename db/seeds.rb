# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# use find_or_create_by (look in activerecord docs)
User.create(username: "Kasar7133", email: "berriosjosef1@gmail.com", password: "password")
User.create(username: "Geot", email: "ggtan@ggtan.net", password: "password")
User.create(username: "Beeb", email: "beeb@beeb.org", password: "password")
Game.create(title: "Fallout 76" )
Game.create(title: "Divinity 2: Original Sin")
Game.create(title: "Dying Light")
Game.create(title: "Far Cry 6")
Game.create(title: "Call of Duty: Warzone")
Game.create(title: "Fall Guys")
Game.create(title: "Diablo III")
GamePost.create(game_title: "Fallout 76", requested_number_of_players: 3, description: "A game about post-apocalyptic life.", user_id: 1, game_id:1, team_name: "The Stardust Crusaders")
GamePost.create(game_title: "Divinity 2", requested_number_of_players: 2, description: "A DND-type RPG where players make their own character", user_id: 3, game_id: 2, team_name: "The Stardust Crusaders")
GamePost.create(game_title: "Dying Light", requested_number_of_players: 1, user_id: 2, game_id: 3, team_name: "The Stardust Crusaders", description: "A Co-op survival adventure ")
GamePost.create(game_title: "Far Cry 6", requested_number_of_players: 1, user_id: 2, game_id: 4, team_name: "The Stardust Crusaders")
GamePost.create(game_title: "Diablo III", requested_number_of_players: 1, user_id: 2, game_id: 7, team_name: "The Stardust Crusaders")
GamePost.create(game_title: "Call of Duty: Warzone", requested_number_of_players: 1, user_id: 2, game_id: 5, team_name: "The Stardust Crusaders")
