require "rails_helper"

RSpec.describe OwnershipResource, type: :resource do
  describe "serialization" do
    let!(:ownership) { create(:ownership) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(ownership.id)
      expect(data.jsonapi_type).to eq("ownerships")
    end
  end

  describe "filtering" do
    let!(:ownership1) { create(:ownership) }
    let!(:ownership2) { create(:ownership) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: ownership2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([ownership2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:ownership1) { create(:ownership) }
      let!(:ownership2) { create(:ownership) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      ownership1.id,
                                      ownership2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      ownership2.id,
                                      ownership1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
