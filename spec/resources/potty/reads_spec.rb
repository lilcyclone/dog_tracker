require 'rails_helper'

RSpec.describe PottyResource, type: :resource do
  describe 'serialization' do
    let!(:potty) { create(:potty) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(potty.id)
      expect(data.jsonapi_type).to eq('potties')
    end
  end

  describe 'filtering' do
    let!(:potty1) { create(:potty) }
    let!(:potty2) { create(:potty) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: potty2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([potty2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:potty1) { create(:potty) }
      let!(:potty2) { create(:potty) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            potty1.id,
            potty2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            potty2.id,
            potty1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
