require 'rails_helper'

RSpec.describe "feedings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/feedings/#{feeding.id}"
  end

  describe 'basic destroy' do
    let!(:feeding) { create(:feeding) }

    it 'updates the resource' do
      expect(FeedingResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Feeding.count }.by(-1)
      expect { feeding.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
