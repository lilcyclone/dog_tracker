require "rails_helper"

RSpec.describe "ownerships#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/ownerships/#{ownership.id}", payload
  end

  describe "basic update" do
    let!(:ownership) { create(:ownership) }

    let(:payload) do
      {
        data: {
          id: ownership.id.to_s,
          type: "ownerships",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(OwnershipResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { ownership.reload.attributes }
    end
  end
end
