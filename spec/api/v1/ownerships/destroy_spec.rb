require "rails_helper"

RSpec.describe "ownerships#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/ownerships/#{ownership.id}"
  end

  describe "basic destroy" do
    let!(:ownership) { create(:ownership) }

    it "updates the resource" do
      expect(OwnershipResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Ownership.count }.by(-1)
      expect { ownership.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
