Rails.application.routes.draw do

  devise_for :food_carts


  devise_for :admins

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'pages#home'

  resource :messages do
    collection do
      post 'receive'
      post 'reply'
      get 'reply'
      get 'text_interface'
    end
  end

  resources :orders, only: [:new, :create]
  resources :order_items, only: [:new, :create]


  resources :food_carts

end
