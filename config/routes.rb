Rails.application.routes.draw do

  devise_for :users
  root 'posts#index'
 
  resources :users, only: [:index, :show] do
    resources :friendships, only: [:create]
    resource :friendships, only: [:update, :destroy]
  end

  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
end
