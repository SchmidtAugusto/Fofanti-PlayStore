Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :products do
    resources :orders, only: %i[create]
  end


  resources :games, only: :show
  resources :lists, only: %i[index show]

  resources :orders, only: %i[index show destroy]
end
