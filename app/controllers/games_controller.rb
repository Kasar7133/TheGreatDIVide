class GamesController < ApplicationController
    before_action :authenticate_user!, except: [:index]

    def index
        @games = Game.all
    end

    def show
        @this_game = Game.find(params[:id])
    end

end