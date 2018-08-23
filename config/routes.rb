Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do
      resources :tools
      resources :users
      resources :tags

      get '/login', to: 'users#login', as: 'login'

      get '/auth/github', to: 'authentication#github', format: false
      get '/current_user', to: 'authentication#show'
    end
  end




end
