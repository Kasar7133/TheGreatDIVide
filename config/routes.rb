Rails.application.routes.draw do
  root 'game_posts#index'
  devise_for :users

  resources :game_posts, only: [:index, :new, :show, :destroy, :create] do
    resources :registrations, only: [:create, :new]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
