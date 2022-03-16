require "rails_helper"

RSpec.describe DogResource, type: :resource do
  describe "serialization" do
    let!(:dog) { create(:dog) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(dog.id)
      expect(data.jsonapi_type).to eq("dogs")
    end
  end

  describe "filtering" do
    let!(:dog1) { create(:dog) }
    let!(:dog2) { create(:dog) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: dog2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([dog2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:dog1) { create(:dog) }
      let!(:dog2) { create(:dog) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      dog1.id,
                                      dog2.id,
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
                                      dog2.id,
                                      dog1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
