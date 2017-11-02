require 'unirest'
require 'pp'

jwt = ""

while true
  system "clear"
  puts "CANDY STORE APP - Choose an option:"
  puts "[1] Show all products"
  puts "  [1.1] Show all products sorted by price ascending"
  puts "  [1.2] Show all products sorted by price descending"
  puts "  [1.3] Show only discounted products"
  puts "  [1.4] Search products by name"
  puts "  [1.5] Show products by category"
  puts "[2] Show one product"
  puts "[3] Create a new product"
  puts "[4] Update a product"
  puts "[5] Destroy a product"
  puts
  puts "[cart] Show your shopping cart"
  puts
  puts "[6] Show your orders"
  puts "[7] Show one order"
  puts
  puts "[8] Signup (create a user)"
  puts "[9] Login (create a JSON web token)"
  puts "[10] Logout (erase the JSON web token)"
  puts
  puts "[0] Exit"
  option = gets.chomp
  system "clear"
  if option == "1"
    puts "Here are all the products:"
    response = Unirest.get("http://localhost:3000/api/v1/products")
    products = response.body
    pp products
    puts "Press enter to continue"
    gets.chomp
  elsif option == "1.1"
    puts "Here are all the products:"
    response = Unirest.get("http://localhost:3000/api/v1/products?sort_attribute=price&sort_order=asc")
    products = response.body
    pp products
    puts "Press enter to continue"
    gets.chomp
  elsif option == "1.2"
    puts "Here are all the products:"
    response = Unirest.get("http://localhost:3000/api/v1/products?sort_attribute=price&sort_order=desc")
    products = response.body
    pp products
    puts "Press enter to continue"
    gets.chomp
  elsif option == "1.3"
    puts "Here are all the products:"
    response = Unirest.get("http://localhost:3000/api/v1/products?discount=true")
    products = response.body
    pp products
    puts "Press enter to continue"
    gets.chomp
  elsif option == "1.4"
    puts "Enter search terms:"
    search_terms = gets.chomp
    puts "Here are all the products:"
    response = Unirest.get("http://localhost:3000/api/v1/products?search=#{search_terms}")
    products = response.body
    pp products
    puts "Press enter to continue"
    gets.chomp
  elsif option == "1.5"
    puts "Choose a category:"
    response = Unirest.get("http://localhost:3000/api/v1/categories")
    categories = response.body
    categories.each do |category|
      puts "[#{category['id']}] #{category['name']}"
    end
    category_id = gets.chomp
    response = Unirest.get("http://localhost:3000/api/v1/products?category_id=#{category_id}")
    products = response.body
    pp products
    puts "Press enter to continue"
    gets.chomp
  elsif option == "2"
    puts "Enter the id of a product to show:"
    id = gets.chomp
    response = Unirest.get("http://localhost:3000/api/v1/products/#{id}")
    product = response.body
    pp product
    puts "Press enter to continue or type 'c' to add to cart"
    if gets.chomp == "c"
      print "Enter a quantity to add to cart: "
      quantity = gets.chomp
      params = {
        quantity: quantity,
        product_id: id
      }
      response = Unirest.post("http://localhost:3000/api/v1/carted_products", parameters: params)
      carted_product = response.body
      pp carted_product
      puts "Press enter to continue"
      gets.chomp
    end
  elsif option == "3"
    params = {}
    response = Unirest.get("http://localhost:3000/api/v1/suppliers")
    suppliers = response.body
    puts "Select a supplier:"
    suppliers.each do |supplier|
      puts "[#{supplier["id"]}] #{supplier["name"]}"
    end
    selected_supplier_id = gets.chomp
    params[:supplier_id] = selected_supplier_id
    print "Name: "
    params[:name] = gets.chomp
    print "Price: "
    params[:price] = gets.chomp
    print "Description: "
    params[:description] = gets.chomp
    response = Unirest.post("http://localhost:3000/api/v1/products", parameters: params)
    created_product = response.body
    pp created_product
    puts "Press enter to continue"
    gets.chomp
  elsif option == "4"
    puts "Enter the id of a product to edit:"
    id = gets.chomp
    response = Unirest.get("http://localhost:3000/api/v1/products/#{id}")
    product = response.body
    params = {}
    print "Name (#{product["name"]}): "
    params[:name] = gets.chomp
    print "Price (#{product["price"]}): "
    params[:price] = gets.chomp
    print "Image (#{product["image"]}): "
    params[:image] = gets.chomp
    print "Description (#{product["description"]}): "
    params[:description] = gets.chomp
    response = Unirest.patch("http://localhost:3000/api/v1/products/#{id}", parameters: params)
    updated_product = response.body
    pp updated_product
    puts "Press enter to continue"
    gets.chomp
  elsif option == "5"
    puts "Enter the id of a product to destroy:"
    id = gets.chomp
    response = Unirest.delete("http://localhost:3000/api/v1/products/#{id}")
    puts response.body["status"]
    puts "Press enter to continue"
    gets.chomp
  elsif option == "cart"
    puts "Here are all the items in the shopping cart:"
    response = Unirest.get("http://localhost:3000/api/v1/carted_products")
    carted_products = response.body
    pp carted_products
    puts "Press enter to continue"
    gets.chomp
  elsif option == "6"
    puts "Here are all the orders:"
    response = Unirest.get("http://localhost:3000/api/v1/orders")
    orders = response.body
    pp orders
    puts "Press enter to continue"
    gets.chomp
  elsif option == "7"
    puts "Enter the id of an order to show:"
    id = gets.chomp
    response = Unirest.get("http://localhost:3000/api/v1/orders/#{id}")
    order = response.body
    pp order
    puts "Press enter to continue"
    gets.chomp
  elsif option == "8"
    Unirest.clear_default_headers()
    puts "Register"
    params = {}
    print "Name: "
    params[:name] = gets.chomp
    print "Email: "
    params[:email] = gets.chomp
    print "Password: "
    params[:password] = gets.chomp
    print "Password confirmation: "
    params[:password_confirmation] = gets.chomp
    response = Unirest.post("http://localhost:3000/api/v1/users", parameters: params)
    pp response.body
    puts "Press enter to continue"
    gets.chomp
  elsif option == "9"
    puts "Login"
    params = {}
    print "Email: "
    params[:email] = gets.chomp
    print "Password: "
    params[:password] = gets.chomp
    response = Unirest.post("http://localhost:3000/user_token", parameters: {auth: {email: params[:email], password: params[:password]}}).body
    pp response
    jwt = response["jwt"]
    Unirest.default_header("Authorization", "Bearer #{jwt}")
    puts "Press enter to continue"
    gets.chomp
  elsif option == "10"
    jwt = ""
    Unirest.clear_default_headers()
    puts "Press enter to continue"
    gets.chomp
  elsif option == "0"
    puts "Thank you! Goodbye."
    break
  else
    puts "Unknown option. Press enter to continue."
    gets.chomp
  end
end
