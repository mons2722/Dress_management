Rails.application.routes.draw do
  get "sign_up", to: "users#new", as: :sign_up
	post "sign_up", to: "users#create"
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
	get "login", to: "sessions#new", as: :login
	post "login", to: "sessions#create"
	get"logout", to: "sessions#destroy", as: :logout
	get "edit_profile", to: "users#edit"
	patch "edit_profile", to: "users#update"

  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  #resources
  resources :categories do
  resources :dresses, only: [:index]
  end
  resources :dresses
 
  delete '/dresses/:id', to: 'dresses#destroy', as: 'delete_dress'
  delete '/categories/:id', to: 'categories#destroy', as: 'delete_category'
 

     # Defines the root path route ("/")
    root "sessions#new"
end
