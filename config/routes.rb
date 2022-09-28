Rails.application.routes.draw do
  root "homepages#index"
  devise_for :users
  resources :games, only: [:index] do
    resources :game_posts, only: [:index, :destroy] 
  end
  
  get "/game_posts/:id", to: "homes#index"
  get "/games/new", to: "homes#index"
  get "/game_posts/new", to: "homes#index"
  
  namespace :api do
    namespace :v1 do
      resources :games, only: [:index, :create] 
      resources :searches, only: [:create]
      resources :game_posts, only: [:show, :new, :create] do
        resources :registrations, only: [:create]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
