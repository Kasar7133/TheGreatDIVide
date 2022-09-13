require 'net/https'
class Api::V1::GamesController < ApplicationController

    def new
        @new_game = Game.new
    end

    def create
        binding.pry
        
    end

end