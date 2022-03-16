require "rails_helper"

RSpec.describe "potties#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/potties/#{potty.id}", payload
  end

  describe "basic update" do
    let!(:potty) { create(:potty) }

    let(:payload) do
      {
        data: {
          id: potty.id.to_s,
          type: "potties",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(PottyResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { potty.reload.attributes }
    end
  end
end
