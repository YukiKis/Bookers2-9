Rails.application.routes.draw do
  get 'home/about', to: "homes#about"
  root "homes#home"
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }
  resources :users do
    member do
      get :followings, :followers
    end
    resources :messages, only: [:create, :destroy, :index]
  end
  get "books/search"
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  resources :relationships, only: [:create, :destroy]

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
