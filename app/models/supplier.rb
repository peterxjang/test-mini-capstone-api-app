class Supplier < ApplicationRecord
  def products
    Product.where(supplier_id: id)
  end

  def as_json
    {
      id: id,
      name: name,
      email: email,
      phone: phone
    }
  end
end
