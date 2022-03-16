require "rails_helper"

RSpec.describe PottyResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "potties",
          attributes: {},
        },
      }
    end

    let(:instance) do
      PottyResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Potty.count }.by(1)
    end
  end

  describe "updating" do
    let!(:potty) { create(:potty) }

    let(:payload) do
      {
        data: {
          id: potty.id.to_s,
          type: "potties",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      PottyResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { potty.reload.updated_at }
      # .and change { potty.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:potty) { create(:potty) }

    let(:instance) do
      PottyResource.find(id: potty.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Potty.count }.by(-1)
    end
  end
end
