class GamePost < ApplicationRecord
    belongs_to :user
    validates :game_title, presence: true
    validates :requested_number_of_players, numericality: {minimum: 1, maximum: 8}


end