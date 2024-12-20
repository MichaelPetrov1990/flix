Rails.application.routes.draw do
  resources :genres
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  root "movies#index"
  get '/routes', to: 'rails/info#routes'
  
  resource :session, only: [:new, :create, :destroy]
  get 'sign_in', to: 'sessions#new'
  
  resources :movies do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end

  get 'movies/filter/:filter', to: 'movies#index', as: :filtered_movies

  resources :users
  get 'sign_up', to: 'users#new'
end
