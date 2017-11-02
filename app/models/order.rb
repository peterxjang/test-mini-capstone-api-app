class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products
  has_many :products, through: :carted_products

  def as_json
    {
      id: id,
      product: product.as_json,
      quantity: quantity,
      subtotal: subtotal,
      tax: tax,
      total: total
    }
  end
end
