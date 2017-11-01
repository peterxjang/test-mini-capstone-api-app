class Api::V1::ProductsController < ApplicationController
  def index
    products = Product.all
    if params[:sort_attribute] && params[:sort_order]
      products = products.order(params[:sort_attribute] => params[:sort_order])
    end
    if params[:discount]
      # products = products.where("price < ?", 2)    # works but isn't DRY
      # products = products.where(discounted: true)  # does not work since discounted is a model method, not part of the database
      products = products.select { |product| product.discounted }
    end
    if params[:search]
      products = products.where("name ILIKE ?", "%#{params[:search]}%")
    end
    render json: products.as_json
  end

  def show
    if params[:id] == "random"
      product = Product.all.sample
    else
      product = Product.find_by(id: params[:id])
    end
    render json: product.as_json
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      image: params[:image],
      description: params[:description]
    )
    product.save
    render json: product.as_json
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name] if params[:name].present?
    product.price = params[:price] if params[:price].present?
    product.image = params[:image] if params[:image].present?
    product.description = params[:description] if params[:description].present?
    product.save
    render json: product.as_json
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: {status: "Product destroyed successfully"}
  end
end
