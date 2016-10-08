require 'spec_helper.rb'
describe CharacterFrequency do
  context "given an array of charactes" do
    it "shows frequency of each character" do
      input = ['a', 'a', 'b', 'c', 'b', 'd', 'c', 'c']
      expect(CharacterFrequency.new(input).to_hash).to eq({'a' => 2, 'b' => 2, 'c' => 3, 'd' => 1})
    end
  end

  context "given an input that is not an array" do
    it "raise InvalidParameter error" do
      input = "string"
      expect{CharacterFrequency.new(input)}.to raise_error(CharacterFrequency::InvalidParameter)
    end
  end
end
