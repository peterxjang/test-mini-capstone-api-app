Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/products" => "products#index"
      get "/products/:id" => "products#show"
      post "/products" => "products#create"
      patch "/products/:id" => "products#update"
      delete "/products/:id" => "products#destroy"

      get "/suppliers" => "suppliers#index"

      post "/users" => "users#create"
    end
  end
end
