Rails.application.routes.draw do
  get "/all_products_url" => "products#all_products_method"
  get "/one_product_url" => "products#one_product_method" 
end
