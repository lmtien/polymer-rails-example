class Order < ActiveRecord::Base
  belongs_to :shop_menu

  def self.all_with_details
    Order.includes(shop_menu: [{product: [:category]}, :product_size])
  end

  def self.with_details(id)
    Order.where(id: id).includes(shop_menu: [{product: [:category]}, :product_size])
  end
end
