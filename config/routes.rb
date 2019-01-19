Rails.application.routes.draw do

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

  get 'pages/classes'
  get 'pages/conservatorio'
  get 'pages/profesores'
  get 'pages/contact'
  get 'pages/blog'
  root 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
