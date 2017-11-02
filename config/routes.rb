Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  
  namespace :api do
    namespace :v1 do
      get "/products" => "products#index"
      get "/products/:id" => "products#show"
      post "/products" => "products#create"
      patch "/products/:id" => "products#update"
      delete "/products/:id" => "products#destroy"

      get "/suppliers" => "suppliers#index"

      get "/orders" => "orders#index"
      get "/orders/:id" => "orders#show"
      post "/orders" => "orders#create"

      get "/categories" => "categories#index"

      post "/users" => "users#create"
    end
  end
end
