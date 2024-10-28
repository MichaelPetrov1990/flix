Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "movies#index"
  get '/routes', to: 'rails/info#routes'

  resources :movies do
    resources :reviews
  end
end
