require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do

  describe "GET #your_reservation" do
    it "returns http success" do
      get :your_reservation
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #your_rent" do
    it "returns http success" do
      get :your_rent
      expect(response).to have_http_status(:success)
    end
  end

end
