Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  resources :patients do
    resources :pains
  end
end
