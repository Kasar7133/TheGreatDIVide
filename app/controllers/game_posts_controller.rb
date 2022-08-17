class GamePostsController<ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :authorize_user, except: [:index, :show, :new, :create]
    def index
        @game_posts = GamePost.all
    end

    def show
        @this_post = GamePost.find(params[:id])
        @host = User.find(@this_post.user_id)
    end

    def new 
        @new_post = GamePost.new
    end

    def create
        # binding.pry
        @new_post= GamePost.new(post_params)
        @new_post.user_id = current_user.id
        if @new_post.save
            flash[:notice] = "You successfully added #{@new_post.game_title}."
            redirect_to game_post_path(@new_post)
          else
            flash.now[:error] = @new_post.errors.full_messages.to_sentence 
            render :new
        end
    end

    private

    def post_params
        params.require(:game_post).permit(:game_title, :requested_number_of_players, :user_id, :description)
    end

end