Rails.application.routes.draw do
  root to: 'users#index'
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      member do
        post 'like', to: 'likes#create'
        delete 'unlike', to: 'likes#destroy'
      end

      resources :comments, only: [:new, :create] 
    end
  end
end
