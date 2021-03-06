require "rails_helper"

RSpec.describe "dogs#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/dogs/#{dog.id}"
  end

  describe "basic destroy" do
    let!(:dog) { create(:dog) }

    it "updates the resource" do
      expect(DogResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Dog.count }.by(-1)
      expect { dog.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
