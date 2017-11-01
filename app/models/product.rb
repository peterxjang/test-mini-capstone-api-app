class Product < ApplicationRecord
  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax.to_f
  end

  def discounted
    price.to_f < 2
  end

  def as_json
    {
      id: id,
      name: name,
      image: image,
      description: description,
      price: price,
      tax: tax,
      total: total,
      discounted: discounted
    }
  end
end
