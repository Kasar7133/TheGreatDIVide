Rails.application.routes.draw do
  root 'game_posts#index'
  devise_for :users

  resources :game_posts, only: [:edit, :index, :new, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
