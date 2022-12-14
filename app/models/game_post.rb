class GamePost < ApplicationRecord
    belongs_to :user
    belongs_to :game
    has_many :registrations
    has_many :users, through: :registrations

    validates :game_title, presence: true
    validates :requested_number_of_players, numericality: {minimum: 1, maximum: 7}
    validates :team_name, presence: true

end