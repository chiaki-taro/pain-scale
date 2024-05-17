Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  resources :pains, only: [:index, :new, :create]
end
