Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  #resources
  resources :categories,  only: [:index, :show]
  resources :dresses
  # Defines the root path route ("/")
  # root "posts#index"
  delete '/dresses/:id', to: 'dresses#destroy', as: 'delete_dress'

  root to: 'categories#index'
end
