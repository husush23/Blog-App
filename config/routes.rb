Rails.application.routes.draw do
  root to: 'users#index'
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show'
  get 'users/:id/posts', to: 'posts#index'
  get 'users/:id/posts/:id', to: 'posts#show'
  get '/new', to: 'users#new'
end
