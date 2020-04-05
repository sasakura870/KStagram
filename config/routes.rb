Rails.application.routes.draw do
  devise_for :users
  get 'tweets/index'
  root "tweets#index"
  resources :users do
    collection do
      get 'search'
    end
  end
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  
  resources :users do
    member do
     get :following, :followers
    end
  end
  resources :relationships,       only: [:create, :destroy]
    
  
  
  
end
