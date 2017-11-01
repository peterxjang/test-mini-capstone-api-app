class Product < ApplicationRecord
  def supplier
    Supplier.find_by(id: supplier_id)
  end

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
      discounted: discounted,
      supplier: supplier.as_json
    }
  end
end
