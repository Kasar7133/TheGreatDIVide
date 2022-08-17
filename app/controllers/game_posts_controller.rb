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
        @new_post= GamePost.new(params)

    end

end