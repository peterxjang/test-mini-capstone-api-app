class Order < ApplicationRecord
  belongs_to :product
  belongs_to :user

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
