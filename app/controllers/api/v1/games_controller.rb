require 'net/https'
class Api::V1::GamesController < ApplicationController
    protect_from_forgery unless: -> { request.format.json? }

    def index
        @all_games = Game.all
        render json: @all_games
    end

    def create
        @new_game = Game.new(title: params["name"])

        if @new_game.save
            render json: {}
        else 
            render json: {error: @new_game.errors.full_messages, status: :unprocessable_entity }
        end

    end

end