Rails.application.routes.draw do

  get 'orders/index'
  get 'orders/create'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :posts do
    resources :comments
  end
  resources :orders, only: [:index]

  resources :courses do
    resources :orders, only: [:create, :destroy]
  end
  root to:"posts#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
