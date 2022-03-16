require 'rails_helper'

RSpec.describe "dogs#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/dogs/#{dog.id}", params: params
  end

  describe 'basic fetch' do
    let!(:dog) { create(:dog) }

    it 'works' do
      expect(DogResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('dogs')
      expect(d.id).to eq(dog.id)
    end
  end
end
