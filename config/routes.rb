Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :items, only: [:index, :new, :create] do
    collection do
      get 'search'
    end
  end
end