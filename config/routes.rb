Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" } 

  
  root to: 'groups#my'

  resources :groups, except: [:index, :destroy] do
    member do
      put :close
      get :buy
      post :checkout
      get :link
      patch :follow
      patch :delete_follow
    end
    collection do
      get :my
      get :attend
      get :public
      get :show_follow
    end
  end

  resources :orders, only: [:show]
  resources :thank, only: [:index]
  post "api/feedback" ,to: "api#feedback"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


end
