class ProductSize < ActiveRecord::Base
  has_many :shop_menu
  has_many :order, :through => :shop_menu
end
