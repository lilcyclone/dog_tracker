require "rails_helper"

RSpec.describe "ownerships#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ownerships", params: params
  end

  describe "basic fetch" do
    let!(:ownership1) { create(:ownership) }
    let!(:ownership2) { create(:ownership) }

    it "works" do
      expect(OwnershipResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["ownerships"])
      expect(d.map(&:id)).to match_array([ownership1.id, ownership2.id])
    end
  end
end
