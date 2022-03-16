require 'rails_helper'

RSpec.describe DogResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'dogs',
          attributes: { }
        }
      }
    end

    let(:instance) do
      DogResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Dog.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:dog) { create(:dog) }

    let(:payload) do
      {
        data: {
          id: dog.id.to_s,
          type: 'dogs',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      DogResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { dog.reload.updated_at }
      # .and change { dog.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:dog) { create(:dog) }

    let(:instance) do
      DogResource.find(id: dog.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Dog.count }.by(-1)
    end
  end
end
