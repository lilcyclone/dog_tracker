require 'rails_helper'

RSpec.describe "feedings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/feedings/#{feeding.id}", payload
  end

  describe 'basic update' do
    let!(:feeding) { create(:feeding) }

    let(:payload) do
      {
        data: {
          id: feeding.id.to_s,
          type: 'feedings',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(FeedingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { feeding.reload.attributes }
    end
  end
end
