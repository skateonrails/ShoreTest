require File.join(File.dirname(__FILE__), '..', 'question_2.rb')

describe Foo do
  context "calling a class method" do
    it "should print to STDOUT the method name" do
      expect{ Foo.boom }.to output("boom").to_stdout
      expect{ Foo.shoreGmbH }.to output("shoreGmbH").to_stdout
    end
  end
end
