Rails.application.routes.draw do
  devise_for :users
  authenticated :user do
    root to: 'recipes#index', as: 'authenticated_root'
  end
  root to: 'welcome#index'

  resources :recipes, only: [:show]
end
