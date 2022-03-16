require 'rails_helper'

RSpec.describe FeedingResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'feedings',
          attributes: { }
        }
      }
    end

    let(:instance) do
      FeedingResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Feeding.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:feeding) { create(:feeding) }

    let(:payload) do
      {
        data: {
          id: feeding.id.to_s,
          type: 'feedings',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      FeedingResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { feeding.reload.updated_at }
      # .and change { feeding.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:feeding) { create(:feeding) }

    let(:instance) do
      FeedingResource.find(id: feeding.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Feeding.count }.by(-1)
    end
  end
end
