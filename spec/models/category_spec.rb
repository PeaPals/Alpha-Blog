require 'rails_helper'


RSpec.describe Category, type: :model do
  context "general validation test" do
    let(:subject) {Category.new(name: "sports")}

    it "Category should be valid" do
      expect(subject).to be_valid
    end

  end

  context "name validation tests" do
    let(:subject) {Category.new(name: "sports")}

    it "name should be present" do
      subject.name = " "
      expect(subject).to_not be_valid
    end

    it "name should be unique" do
      subject.save

      subject_2 = Category.new(name: "sports")
      expect(subject_2).to_not be_valid
    end

    it "name should not be too long" do
      subject.name = "a" * 26
      expect(subject).to_not be_valid
    end

    it "name should not be too short" do
      subject.name = "aa"
      expect(subject).to_not be_valid
    end
  end
end
