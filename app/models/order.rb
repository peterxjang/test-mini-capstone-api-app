class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def as_json
    {
      id: id,
      carted_products: carted_products.as_json,
      subtotal: subtotal,
      tax: tax,
      total: total
    }
  end
end
