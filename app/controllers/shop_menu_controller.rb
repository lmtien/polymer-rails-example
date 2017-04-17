class ShopMenuController < ApplicationController
  def get_menu
    menu = ShopMenu.all_with_details

    result = Jbuilder.encode do |json|
      json.array! menu do |m|
        json.id m.id
        json.product do
          json.id m.product.id
          json.name m.product.name
          json.category do
            json.id m.product.category.id
            json.name m.product.category.name
          end
        end
        json.product_size do
          json.id m.product_size.id
          json.name m.product_size.name
        end
        json.price m.price
      end
    end

    render json: result
  end
end