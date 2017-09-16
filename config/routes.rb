Rails.application.routes.draw do
  post 'authentication/login', to: 'authentication#login', as: :login
  post 'authentication/signup', to: 'authentication#signup', as: :signup

  get 'authentication/signup'

  root to: 'public#index'
end
