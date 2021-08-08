Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :events
  resources :users, only: [:show]

  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
