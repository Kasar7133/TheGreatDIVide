Rails.application.routes.draw do
  root "homepages#index"
  devise_for :users
  resources :games, only: [:index, :show, :new, :create] do
    resources :game_posts, only: [:index, :destroy] 
  end
  resources :game_posts, only: [:new, :create]
  get "/game_posts/:id", to: "homes#index"

  namespace :api do
    namespace :v1 do
      resources :game_posts, only: [:show]do
        resources :registrations, only: [:create]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
