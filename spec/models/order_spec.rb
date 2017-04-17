require 'rails_helper'

RSpec.describe Order, type: :model do
  describe "all_with_details" do
    before do
      @ctg = FactoryGirl.create(:category, :coffee)
      @pdt = FactoryGirl.create(:product, :green_tea, category: @ctg)
      @smn = FactoryGirl.create(:shop_menu, :cappuccino_grande, product: @pdt)
      FactoryGirl.create(:order, quantity: 3, price: @smn.price*3, shop_menu: @smn)
    end

    it "return expected 1-level nested child" do
      order = Order.all_with_details
      expect(order.length).to eq 1
      expect(order[0].shop_menu).to match @smn
    end

    it "return expected 2-level nested child" do
      order = Order.all_with_details
      expect(order.length).to eq 1
      expect(order[0].shop_menu.product).to match @pdt
    end

    it "return expected 3-level nested child" do
      order = Order.all_with_details
      expect(order.length).to eq 1
      expect(order[0].shop_menu.product.category).to match @ctg
    end
  end

  describe "with_details(id)" do
    before do
      @ctg = FactoryGirl.create(:category, :coffee)
      @pdt = FactoryGirl.create(:product, :green_tea, category: @ctg)
      @smn = FactoryGirl.create(:shop_menu, :cappuccino_grande, product: @pdt)
      @ord = FactoryGirl.create(:order, quantity: 3, price: @smn.price*3, shop_menu: @smn)
    end

    it "return expected 1-level nested child" do
      order = Order.with_details @ord.id
      expect(order.length).to eq 1
      expect(order[0].id).to eq @ord.id
      expect(order[0].shop_menu).to match @smn
    end

    it "return expected 2-level nested child" do
      order = Order.with_details @ord.id
      expect(order.length).to eq 1
      expect(order[0].id).to eq @ord.id
      expect(order[0].shop_menu.product).to match @pdt
    end

    it "return expected 3-level nested child" do
      order = Order.with_details @ord.id
      expect(order.length).to eq 1
      expect(order[0].id).to eq @ord.id
      expect(order[0].shop_menu.product.category).to match @ctg
    end
  end
end
