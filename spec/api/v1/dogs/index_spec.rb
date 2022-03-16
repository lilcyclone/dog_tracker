require "rails_helper"

RSpec.describe "dogs#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/dogs", params: params
  end

  describe "basic fetch" do
    let!(:dog1) { create(:dog) }
    let!(:dog2) { create(:dog) }

    it "works" do
      expect(DogResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["dogs"])
      expect(d.map(&:id)).to match_array([dog1.id, dog2.id])
    end
  end
end
