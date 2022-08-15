class Team < ApplicationRecord
has_many :teams_users
has_many :users, through: :teams_users
before_action :authenticate_user!, except: [:index, :show]

validates :player_count, numericality: {minimum: 1, maximum: 4}


end