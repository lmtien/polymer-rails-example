require 'rails_helper'

RSpec.describe OrderController, type: :controller do
  describe "GET #get_order" do
    before do
      menu = FactoryGirl.create(:shop_menu, :latte_grande)
      @order = FactoryGirl.create(:order,
                                  shop_menu: menu,
                                  quantity: 5,
                                  price: menu.price*5)

      get :get_order
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "response with JSON body containing expected order" do
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 1
      expect(json_response[0]['shop_menu']['product']['name']).to match @order.shop_menu.product.name
    end
  end

  describe "POST #create" do
    let(:valid_session) { {} }

    before do
      @menu = FactoryGirl.create(:shop_menu, :latte_grande)

      post :create,
        session: valid_session,
        order: {
          shop_menu_id: @menu.id,
          quantity: 10,
          price: @menu.price*10
        }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "response with JSON body containing expected order" do
      json_response = JSON.parse(response.body)
      expect(json_response.length).to eq 1
      expect(json_response[0]['shop_menu']['product']['name']).to match @menu.product.name
    end
  end
end
