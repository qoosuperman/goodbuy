Rails.application.routes.draw do
  devise_for :users

  resources :groups do
    collection do
      get :my
      get :attend
      get :public
    end
  end

end
