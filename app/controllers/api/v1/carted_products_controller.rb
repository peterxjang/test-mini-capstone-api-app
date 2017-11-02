class Api::V1::CartedProductsController < ApplicationController
  before_action :authenticate_user

  def index
    carted_products = current_user.carted_products.where(status: "carted")
    render json: carted_products.as_json
  end
  
  def create
    carted_product = CartedProduct.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      status: "carted"
    )
    carted_product.save
    render json: carted_product.as_json
  end
end
