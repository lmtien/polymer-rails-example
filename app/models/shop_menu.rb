class ShopMenu < ActiveRecord::Base
  belongs_to :product
  belongs_to :product_size
  has_many :order
  
  def self.all_with_details
    ShopMenu.includes({product: [:category]}, :product_size)
  end
end
