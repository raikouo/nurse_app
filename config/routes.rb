Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :items, only: [:index, :new, :create, :show] do
    resources :studies, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end