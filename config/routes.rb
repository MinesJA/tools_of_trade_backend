Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do
      resources :users do
        resources :tools, only: [:create, :destroy]
        patch '/tools/:id/save', to: 'tools#save'
        patch '/tools/:id/vote', to: 'tools#vote'
        delete '/tools/:id/unsave', to: 'tools#unsave'
      end

      resources :tools, only: [:index, :update]
      resources :tags, only: [:index]

      get '/auth/github', to: 'authentication#github', format: false
      get '/current_user', to: 'authentication#show'

    end
  end




end
