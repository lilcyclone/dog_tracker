require "rails_helper"

RSpec.describe "potties#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/potties/#{potty.id}", params: params
  end

  describe "basic fetch" do
    let!(:potty) { create(:potty) }

    it "works" do
      expect(PottyResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("potties")
      expect(d.id).to eq(potty.id)
    end
  end
end
