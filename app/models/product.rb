class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  has_many :carted_products
  has_many :orders, through: :carted_products
  has_many :category_products
  has_many :categories, through: :category_products

  validates :name, presence: true

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
      description: description,
      price: price,
      tax: tax,
      total: total,
      discounted: discounted,
      supplier: supplier.as_json,
      images: images.as_json,
      categories: categories.as_json
    }
  end
end
