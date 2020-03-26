Rails.application.routes.draw do
  devise_for :users
  get 'tweets/index'
  root "tweets#index"
  resources :users 
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
    
  
  
  
end
