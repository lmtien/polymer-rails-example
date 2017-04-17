require 'rails_helper'

RSpec.describe ShopMenuController, type: :controller do
  describe "GET #get_menu" do
    before do
      @menu = FactoryGirl.create(:shop_menu, :latte_grande)
      get :get_menu
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "response with JSON body containing expected order" do
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 1
      expect(json_response[0]['product']['name']).to match @menu.product.name
    end
  end
end
