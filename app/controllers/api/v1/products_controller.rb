class Api::V1::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

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
    if params[:category_id]
      products = Category.find_by(id: params[:category_id]).products
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
      description: params[:description],
      supplier_id: params[:supplier_id]
    )
    if product.save
      render json: product.as_json
    else
      render json: {errors: product.errors.full_messages}, status: :bad_request
    end
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
