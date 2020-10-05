Rails.application.routes.draw do
  get 'home/about', to: "homes#about"
  root "homes#home"
  devise_for :users
  resources :users do
    member do
      get :followings, :followers
    end
  end
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
