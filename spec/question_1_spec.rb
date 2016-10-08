require File.join(File.dirname(__FILE__), '..', 'question_1.rb')

describe CharacterFrequency do
  context "given an array of charactes" do
    let(:input){ ['a', 'a', 'b', 'c', 'b', 'd', 'c', 'c'] }

    it "shows frequency of each character" do
      expect(CharacterFrequency.new(input).to_hash).to eq({'a' => 2, 'b' => 2, 'c' => 3, 'd' => 1})
    end
  end

  context "given an input that is not an array" do
    let(:input) { "string" }

    it "raise InvalidParameter error" do
      expect{CharacterFrequency.new(input)}.to raise_error(CharacterFrequency::InvalidParameter)
    end
  end
end
