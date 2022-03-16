require 'rails_helper'

RSpec.describe "potties#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/potties/#{potty.id}"
  end

  describe 'basic destroy' do
    let!(:potty) { create(:potty) }

    it 'updates the resource' do
      expect(PottyResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Potty.count }.by(-1)
      expect { potty.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
