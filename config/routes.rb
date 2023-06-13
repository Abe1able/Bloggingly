Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # resources :users, only: [:index, :show] do
  #   resources :posts, only: [:index, :show]
  # end

  # get "/users/:user_id/posts", to: "posts#index", as: "user_posts"
  # get "/users/:user_id/posts/:id", to: "posts#show", as: "user_post"
  # get "/users/:id", to: "users#show", as: "user"
  # get "/users", to: "users#index"
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  root "users#index"
end
