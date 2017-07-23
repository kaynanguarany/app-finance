Rails.application.routes.draw do
  get 'categories/index'

  get 'categories/new'

  root "home#index"

  resources :categories
end
