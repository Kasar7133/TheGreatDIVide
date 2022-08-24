class Api::V1::GamePostsController < ApplicationController
    before_action :authenticate_user!

    def show
        gamePost = GamePost.find(params[:id])
        host = User.find(gamePost.user_id)

        # We need to replace GameSession with a serializer
        session = GameSession.new(
            gamePost.game_title,
            host,
            gamePost.requested_number_of_players,
            gamePost.users,
            gamePost.description,
        )
        # binding.pry

        render json: {session: session, current_user: current_user }
    end

    # delete to replace with a serializer
    class GameSession
        attr_accessor :game_title, :host, :requested_number_of_players, :players, :description

        def initialize(game_title, host, requested_number_of_players, players, description)
            @game_title = game_title
            @host= host
            @requested_number_of_players= requested_number_of_players
            @players= players
            @description= description
        end
    end
end