class RegistrationsController<ApplicationController

    def new
        @new_player = Registration.new(user: current_user, game_post_id: params[:game_post_id])
        @new_player.save
        redirect_to game_post_path(@new_player.game_post_id)
    end

end