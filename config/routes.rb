Rails.application.routes.draw do
  devise_for :users
  root 'homes#index'

  resources :topics, only: [:show, :new, :create] do
    resources :messages, only: [:create, :destroy]
  end
end
