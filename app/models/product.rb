class Product < ActiveRecord::Base
  belongs_to :category
  has_many :order, :through => :shop_menu
end
