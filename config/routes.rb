Rails.application.routes.draw do
  devise_for :users
  get 'tweets/index'
  root "tweets#index"
  resources :tweets, only: [:index, :show, :new, :create, :destroy, :edit, :update] 
  resources :users ,only: :show
  get    'users/:id'   =>  'users#show'
  #   collection do
  #   get 'search'
  #   end
  # end
  
end
