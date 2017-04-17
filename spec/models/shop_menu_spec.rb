require 'rails_helper'

RSpec.describe ShopMenu, type: :model do
  describe "all_with_details" do
    before do
      @ctg = FactoryGirl.create(:category, :coffee)
      @pdt = FactoryGirl.create(:product, :green_tea, category: @ctg)
      FactoryGirl.create(:shop_menu, :cappuccino_grande, product: @pdt)
    end

    it "return expected 1-level nested child" do
      menu = ShopMenu.all_with_details
      expect(menu.length).to eq 1
      expect(menu[0].product).to match @pdt
    end

    it "return expected 2-level nested child" do
      menu = ShopMenu.all_with_details
      expect(menu.length).to eq 1
      expect(menu[0].product.category).to match @ctg
    end
  end
end
