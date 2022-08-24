class Api::V1::RegistrationsController<ApplicationController
    protect_from_forgery unless: -> { request.format.json? }

    # def new
    #     @new_player = Registration.new(user_id: player_params, game_post_id: params[:game_post_id])
    #     redirect_to game_post_path(@new_player.game_post_id)
    # end

    def create

        # if a registration exists between a game_post and a user, 
        existing_game = Registration.find_by(user: current_user, game_post_id: params[:game_post_id])
        if existing_game!=nil
            render json: { message: "you have already registered"}
        else 
            @registration = Registration.new(game_post_id: params[:game_post_id], user: current_user )
            
            if @registration.save
                render json: {}
            else 
                render json: {error: @registration.errors.full_messages, status: :unprocessable_entity }
            end
        end

        
        
    end

    private

    # def player_params
    #     params.require(:players).permit(:id)
    # end

end