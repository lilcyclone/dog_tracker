require "rails_helper"

RSpec.describe Feeding, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:dog) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
