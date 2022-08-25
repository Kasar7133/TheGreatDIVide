class GamesController < ApplicationController
    
    def index
        @games = Game.all
    end

    def new
        @new_game = Game.new
    end

    def create
        @new_game = Game.new(params.title)
        if @new_game.save
            flash[:notice] = "Added game successfully."
            redirect_to game_path(@new_game)
        else
            flash.now[:error] = @new_game.errors.full_messages.to_sentence
            render :new
        end

    end

    def show
        @this_game = Game.find(params[:id])
    end

end