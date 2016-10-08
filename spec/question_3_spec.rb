require File.join(File.dirname(__FILE__), '..', 'question_3.rb')

describe CustomAdd do
  let(:custom_add) { CustomAdd.new }

  describe "#add" do
    context "calling with numeric parameters" do
      it "should return the sum of parameters" do
        expect( custom_add.add(1,2) ).to eq(3)
        expect( custom_add.add(1,-2) ).to eq(-1)
      end
    end

    context "calling with string parameters" do
      it "should return the second parameter appended to first parameter" do
        expect( custom_add.add("a","2") ).to eq("a2")
      end
    end

    context "calling with array parameters" do
      it "should return the second parameter appended to first parameter" do
        expect( custom_add.add([1],[2]) ).to eq([1, 2])
      end
    end
  end
end
