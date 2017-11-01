class Image < ApplicationRecord
  def product
    Product.find_by(id: product_id)
  end

  def as_json
    {
      id: id,
      url: url
    }
  end
end
