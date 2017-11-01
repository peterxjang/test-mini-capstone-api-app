class Supplier < ApplicationRecord
  has_many :products

  def as_json
    {
      id: id,
      name: name,
      email: email,
      phone: phone
    }
  end
end
