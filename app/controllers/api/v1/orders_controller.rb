class Api::V1::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    orders = current_user.orders
    render json: orders.as_json
  end

  def show
    order = Order.find_by(id: params[:id])
    render json: order.as_json
  end

  def create
    carted_products = current_user.carted_products.where(status: "carted")
    order = Order.new(
      user_id: current_user.id
    )
    order.save
    carted_products.update_all(status: "purchased", order_id: order.id)
    order.update_totals
    render json: order.as_json
  end
end
