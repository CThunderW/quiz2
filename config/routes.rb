Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :ideas do
    resources :reviews, shallow: true, only: [:create, :destroy, :edit, :update]
  end 
  
  get 'home/index'
  root 'home#index'
end
