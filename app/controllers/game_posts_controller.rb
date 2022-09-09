class GamePostsController<ApplicationController
    before_action :authenticate_user!
    def index
        @game_posts = GamePost.where(game_id: params[:game_id])
    end
      
      def new 
        @new_post = GamePost.new
      end
      
      def create
        @new_post= GamePost.new(post_params)
        @new_post.user = current_user
        @this_game = Game.find(post_params[:game_id])
        @new_post.game_title = @this_game.title
        if @new_post.save
            flash[:notice] = "You successfully added a post to #{@new_post.game_title}."
            redirect_to "/game_posts/#{@new_post.id}"
          else
            flash.now[:error] = @new_post.errors.full_messages.to_sentence 
            render :new
        end
    end
    
    def destroy
        @post = GamePost.find(params[:id])
        @host = @post.user
        if current_user===@host && @post.destroy
          
          flash[:notice] = "Post Deleted."
          redirect_to game_posts_path
        else
          flash.now[:error] = "Unable to delete post"
          render :edit
        end
    
      end

    private

    def post_params
        params.require(:game_post).permit(:game_title, :requested_number_of_players, :user_id, :description, :team_name, :game_id)
    end
    
end