Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books
  resources :users
  get "/home/about", to: 'homes#about', as: :about

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
