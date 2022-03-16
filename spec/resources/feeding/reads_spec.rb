require 'rails_helper'

RSpec.describe FeedingResource, type: :resource do
  describe 'serialization' do
    let!(:feeding) { create(:feeding) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(feeding.id)
      expect(data.jsonapi_type).to eq('feedings')
    end
  end

  describe 'filtering' do
    let!(:feeding1) { create(:feeding) }
    let!(:feeding2) { create(:feeding) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: feeding2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([feeding2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:feeding1) { create(:feeding) }
      let!(:feeding2) { create(:feeding) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            feeding1.id,
            feeding2.id
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
            feeding2.id,
            feeding1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
