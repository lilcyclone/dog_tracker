require 'rails_helper'

RSpec.describe OwnershipResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'ownerships',
          attributes: { }
        }
      }
    end

    let(:instance) do
      OwnershipResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Ownership.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:ownership) { create(:ownership) }

    let(:payload) do
      {
        data: {
          id: ownership.id.to_s,
          type: 'ownerships',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      OwnershipResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { ownership.reload.updated_at }
      # .and change { ownership.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:ownership) { create(:ownership) }

    let(:instance) do
      OwnershipResource.find(id: ownership.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Ownership.count }.by(-1)
    end
  end
end
