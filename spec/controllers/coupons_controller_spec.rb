require 'rails_helper'

describe CuponsController do

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new coupon" do
        expect{
          post :create, { :cupon => { :cupon_code => "ASD123", :store => "Dean and Deluca" } }
        }.to change(Cupon,:count).by(1)
      end

      it "redirects to the new coupon" do
        post :create, { :cupon => { :cupon_code => "ASD123", :store => "Dean and Deluca" } }
        expect(response).to redirect_to Cupon.last
      end
    end
  end

end
