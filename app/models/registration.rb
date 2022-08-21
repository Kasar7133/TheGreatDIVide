class Registration < ApplicationRecord
    belongs_to :game_post
    belongs_to :user

end
