class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    product = Product.find_by(id: params[:id])
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
