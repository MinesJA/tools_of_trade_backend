Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do
      resources :users do
        resources :tools, only: [:create, :update, :destroy]
      end

      resources :tools, only: [:index]
      resources :tags, only: [:index]

      get '/auth/github', to: 'authentication#github', format: false
      get '/current_user', to: 'authentication#show'
      
    end
  end




end
