require 'net/https'
class Api::V1::GamePostsController < ApplicationController
    before_action :authenticate_user!

    def new
       @new_post = GamePost.new
       
    end

    def create
        @new_post= GamePost.new(post_params)
        @new_post.user = current_user
        @this_game = Game.find(post_params[:game_id])
        @new_post.game_title = @this_game.title
    end
    
    def show
        gamePost = GamePost.find(params[:id])
        host = User.find(gamePost.user_id)
        
        # We need to replace GameSession with a serializer
        
        http = Net::HTTP.new('api.igdb.com',443)
        http.use_ssl = true
        request = Net::HTTP::Post.new(URI('https://api.igdb.com/v4/games'), {'Client-ID' => "#{ENV["THE_ID"]}", 'Authorization' => "Bearer #{ENV["THE_KEY"]}"})
        request.body = "fields name; where name=\"#{gamePost.game_title}\";"
        response = http.request(request).body
        gameData = JSON.parse response

        http = Net::HTTP.new('api.igdb.com',443)
        http.use_ssl = true
        request = Net::HTTP::Post.new(URI('https://api.igdb.com/v4/covers'), {'Client-ID' => "#{ENV["THE_ID"]}", 'Authorization' => "Bearer #{ENV["THE_KEY"]}"})
        if !gameData.empty?
            request.body = "fields game, image_id; where game=#{gameData[0]["id"]};"
            imageResponse = http.request(request).body
            gameCover = JSON.parse imageResponse
            # https://api-docs.igdb.com/?ruby#images
            imageUrl= "https://images.igdb.com/igdb/image/upload/t_cover_big/#{gameCover[0]["image_id"]}.jpg"
        end
        session = GameSession.new(
            gamePost.game_title,
            host,
            gamePost.requested_number_of_players,
            gamePost.users,
            gamePost.description,
            imageUrl
        )

        render json: {session: session, current_user: current_user }
    end

    # delete to replace with a serializer
    class GameSession
        attr_accessor :game_title, :host, :requested_number_of_players, :players, :description, :image_url

        def initialize(game_title, host, requested_number_of_players, players, description, image_url)
            @game_title = game_title
            @host= host
            @requested_number_of_players= requested_number_of_players
            @players= players
            @description= description
            @image_url= image_url
        end
    end
    private
    def post_params
        params.require(:game_post).permit(:game_title, :requested_number_of_players, :user_id, :description, :team_name, :game_id)
    end
end   