Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  
  root to: 'groups#index'

  resources :groups do
    collection do
      get :my
      get :attend
      get :public
    end
  end

end
