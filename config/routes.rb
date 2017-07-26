Rails.application.routes.draw do
  devise_for :food_carts
  devise_for :admins

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  root to: 'pages#home'

  resource :messages do
    collection do
      post 'receive'
      post 'reply'
      get 'text_interface'
    end
  end


  resources :food_carts, only: [:index, :show]

end
