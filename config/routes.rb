Rails.application.routes.draw do
 root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
  get 'rankings/want', to: 'rankings#want'
  get 'rankings/have', to: 'rankings#have'
  
   resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
    end
    collection do
      get :search
    end
  end
  
  resources :items, only: [:show, :new]
  resources :ownerships, only: [:create, :destroy]

end
