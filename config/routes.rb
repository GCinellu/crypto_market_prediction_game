Rails.application.routes.draw do
  post 'authentication/login', to: 'authentication#login', as: :login

  get 'authentication/signup'

  root to: 'public#index'
end
