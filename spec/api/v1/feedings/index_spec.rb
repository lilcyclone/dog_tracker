require 'rails_helper'

RSpec.describe "feedings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/feedings", params: params
  end

  describe 'basic fetch' do
    let!(:feeding1) { create(:feeding) }
    let!(:feeding2) { create(:feeding) }

    it 'works' do
      expect(FeedingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['feedings'])
      expect(d.map(&:id)).to match_array([feeding1.id, feeding2.id])
    end
  end
end
