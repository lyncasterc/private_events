Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  
  resources :events do
    resources :attendees_events, only: [:new, :create, :destroy]
  end
  resources :users, only: [:show]

  get '/events/:id/attend', to: 'events#attend'

  root 'events#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
