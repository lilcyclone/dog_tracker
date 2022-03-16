require 'rails_helper'

RSpec.describe "ownerships#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/ownerships/#{ownership.id}", params: params
  end

  describe 'basic fetch' do
    let!(:ownership) { create(:ownership) }

    it 'works' do
      expect(OwnershipResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('ownerships')
      expect(d.id).to eq(ownership.id)
    end
  end
end
