require 'unirest'
require 'pp'

while true
  system "clear"
  puts "CANDY STORE APP - Choose an option:"
  puts "[1] Show all products"
  puts "[2] Show one product"
  puts "[3] Create a new product"
  puts "[4] Update a product"
  puts "[5] Destroy a product"
  puts
  puts "[0] Exit"
  option = gets.chomp
  system "clear"
  if option == "1"
    puts "Here are all the products:"
    response = Unirest.get("http://localhost:3000/products")
    products = response.body
    pp products
    puts "Press enter to continue"
    gets.chomp
  elsif option == "2"
    puts "Enter the id of a product to show:"
    id = gets.chomp
    response = Unirest.get("http://localhost:3000/products/#{id}")
    product = response.body
    pp product
    puts "Press enter to continue"
    gets.chomp
  elsif option == "3"
    params = {}
    print "Name: "
    params[:name] = gets.chomp
    print "Price: "
    params[:price] = gets.chomp
    print "Image: "
    params[:image] = gets.chomp
    print "Description: "
    params[:description] = gets.chomp
    response = Unirest.post("http://localhost:3000/products", parameters: params)
    created_product = response.body
    pp created_product
    puts "Press enter to continue"
    gets.chomp
  elsif option == "4"
    puts "Enter the id of a product to edit:"
    id = gets.chomp
    response = Unirest.get("http://localhost:3000/products/#{id}")
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
    response = Unirest.patch("http://localhost:3000/products/#{id}", parameters: params)
    updated_product = response.body
    pp updated_product
    puts "Press enter to continue"
    gets.chomp
  elsif option == "5"
    puts "Enter the id of a product to destroy:"
    id = gets.chomp
    response = Unirest.delete("http://localhost:3000/products/#{id}")
    puts response.body["status"]
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
