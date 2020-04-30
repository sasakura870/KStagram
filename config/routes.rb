Rails.application.routes.draw do
  root "tweets#index"
  devise_for :users
  get 'tweets/index'
  
  # get 'about', to: 'static_pages#about'
  
  resources :users do
    collection do
      get 'search'
    end
  end
  resources :users do
    member do
     get :following, :followers
    end
    collection do
      get 'about'
    end
    collection do
      get 'kiyaku'
    end
    collection do
      get 'privacy'
    end
  end
  resources :relationships,       only: [:create, :destroy]
  resources :tweets do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
    collection do
      get 'about'
    end
    collection do
      get 'kiyaku'
    end
    collection do
      get 'privacy'
    end
  end
    
  # get '/tweet/hashtag/:name', to: "tweets#hashtag"
  
  
end
