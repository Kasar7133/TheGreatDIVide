class Game < ApplicationRecord
    has_many :game_posts
    validates :title, presence: true, uniqueness: true

end