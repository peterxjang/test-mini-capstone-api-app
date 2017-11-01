class Image < ApplicationRecord
  belongs_to :product

  def as_json
    {
      id: id,
      url: url
    }
  end
end
