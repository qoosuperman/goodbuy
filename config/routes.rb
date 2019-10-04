Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  root to: 'groups#my'

  resources :groups do
    member do
      put :close
      get :buy
      post :checkout
      get :link
    end
    collection do
      get :my
      get :attend
      get :public
    end
  end

  resources :orders, only: [:show]
  resources :thank, only: [:index]
  post "api/feedback" ,to: "api#feedback"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'


end
