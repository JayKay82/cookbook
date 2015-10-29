Rails.application.routes.draw do
  # User routes
  devise_for :users
  resources :users, only: [:show]

  # Root routes
  authenticated :user do
    root to: 'recipes#index', as: 'authenticated_root'
  end
  root to: 'welcome#index'

  # Recipe routes
  resources :recipes do
    resources :ingredients, only: [:create, :new]
  end
end
