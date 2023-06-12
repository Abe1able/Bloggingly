Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  root "users#index"
end
