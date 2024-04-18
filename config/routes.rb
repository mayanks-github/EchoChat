Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'

  resources :topics
  resources :messages
end
