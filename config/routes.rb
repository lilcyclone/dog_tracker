Rails.application.routes.draw do
  root :to => "dogs#index"
  resources :potties
  resources :feedings
  resources :ownerships
  resources :dogs
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
