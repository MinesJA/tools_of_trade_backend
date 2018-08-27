Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do

      resources :users do
        # /api/v1/users/:id/tools
        resources :tools, only: [:create, :update]
      end

      resources :tools
      resources :users
      resources :tags

      # patch '/tools/:id', to: 'tool#update'

      get '/auth/github', to: 'authentication#github', format: false
      get '/current_user', to: 'authentication#show'


      # add a tool
      # save a tool
      # upvote a tool
      # downvote a tool
    end
  end




end
