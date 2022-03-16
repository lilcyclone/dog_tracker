require 'rails_helper'

RSpec.describe Potty, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:dog) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:pee_or_poo) }

    it { should validate_inclusion_of(:pee_or_poo).in_array([ "pee", "poo", "both" ]) }

    end
end
