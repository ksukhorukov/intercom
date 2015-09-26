require 'spec_helper'
require_relative '../lib/flatten'

describe "Flatten Library" do 

    let(:correct_result) { [1,2,3,4,5] }

    it "should leave normal array as it is" do
      test = [1,2,3,4,5]
      expect(flatten(test)).to eq(correct_result)
    end

    it "should flatten an array with inner incapsualtion level equals to two" do 
      test = [1,2,3,[4,5]]
      expect(flatten(test)).to eq(correct_result)
    end

    it "should flatten an array with inner incapsualtion level equals to three" do 
      test = [1,2,[3,[4,5]]]
      expect(flatten(test)).to eq(correct_result)
    end

    it "should skip empty arrays" do
      test = [[[[]]]]
      expect(flatten(test)).to eq([])
    end

end