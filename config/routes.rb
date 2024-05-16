Rails.application.routes.draw do
  devise_for :users
  root to: 'pains#index'
  resources :pains, only: [:index, :new, :create]
end
