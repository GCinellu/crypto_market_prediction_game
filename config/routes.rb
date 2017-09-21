Rails.application.routes.draw do
  post '/authentication/login', to: 'authentication#login', as: :login
  post '/authentication/signup', to: 'authentication#signup', as: :signup

  resources :predictions, only: [:index, :show, :create, :destroy]
  resources :predicteds,  only: [:index, :show]

  root to: 'public#index'
end
