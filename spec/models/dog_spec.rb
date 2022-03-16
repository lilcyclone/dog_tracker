require "rails_helper"

RSpec.describe Dog, type: :model do
  describe "Direct Associations" do
    it { should have_many(:feedings) }

    it { should have_many(:potties) }

    it { should have_many(:ownerships) }
  end

  describe "InDirect Associations" do
    it { should have_many(:owners) }
  end

  describe "Validations" do
    it { should validate_presence_of(:name) }
  end
end
