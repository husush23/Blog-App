Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      member do
        post 'like'
        delete 'unlike'
      end
    end
  end
end

