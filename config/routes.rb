Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "pages#home"

  resources :alcools, only: %i[index show]
  resources :cocktails, only: %i[index create show]
  get 'search', to: 'alcools#search'
end
