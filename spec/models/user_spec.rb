require 'rails_helper'

RSpec.describe User, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:ownerships) }

    end

    describe "InDirect Associations" do

    it { should have_many(:dogs) }

    end

    describe "Validations" do

    it { should validate_presence_of(:name) }

    end
end
