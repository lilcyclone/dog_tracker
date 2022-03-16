require "rails_helper"

RSpec.describe "potties#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/potties", params: params
  end

  describe "basic fetch" do
    let!(:potty1) { create(:potty) }
    let!(:potty2) { create(:potty) }

    it "works" do
      expect(PottyResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["potties"])
      expect(d.map(&:id)).to match_array([potty1.id, potty2.id])
    end
  end
end
