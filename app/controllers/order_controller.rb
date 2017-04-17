class OrderController < ApplicationController
  def get_order
    render json: generate_json(Order.all_with_details)
  end

  def create
    order = Order.new(order_params)

    if order.save
      render json: generate_json(Order.with_details(order.id)), status: :created
    else
      render json: order.errors, status: :unprocessable_entity
    end
  end

  private
    def order_params
      params.require(:order).permit(:shop_menu_id, :quantity, :price)
    end

    def generate_json(orders)
      Jbuilder.encode do |json|
        json.array! orders do |order|
          json.id order.id
          json.quantity order.quantity
          json.price order.price
          json.shop_menu do
            json.id order.shop_menu.id
            json.product do
              json.id order.shop_menu.product.id
              json.name order.shop_menu.product.name
              json.category do
                json.id order.shop_menu.product.category.id
                json.name order.shop_menu.product.category.name
              end
            end
            json.product_size do
              json.id order.shop_menu.product_size.id
              json.name order.shop_menu.product_size.name
            end
            json.price order.shop_menu.price
          end
        end
      end
    end
end