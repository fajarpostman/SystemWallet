Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :users
  resources :teams
  resources :stocks
  resources :transactions, only: [:create]
    
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'stock_prices/price', to: 'stock_prices#price'
  get 'stock_prices/prices', to: 'stock_prices#prices'
  get 'stock_prices/price_all', to: 'stock_prices#price_all'

  resources :wallets, only: [] do
    member do
      get :balance, to: 'wallets#show_balance', as: 'balance'
    end
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
