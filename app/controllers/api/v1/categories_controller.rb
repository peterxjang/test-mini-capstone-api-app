class Api::V1::CategoriesController < ApplicationController
  def index
    categories = Category.all
    render json: categories.as_json
  end
end
