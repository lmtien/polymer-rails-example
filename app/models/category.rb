class Category < ActiveRecord::Base
  has_many :product
  has_many :shop_menu, :through => :product
end
