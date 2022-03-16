require "rails_helper"

RSpec.describe "dogs#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/dogs/#{dog.id}", payload
  end

  describe "basic update" do
    let!(:dog) { create(:dog) }

    let(:payload) do
      {
        data: {
          id: dog.id.to_s,
          type: "dogs",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(DogResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { dog.reload.attributes }
    end
  end
end
