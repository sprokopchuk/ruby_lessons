require 'rspec'
require './method_max_array.rb'

describe "Array" do
  context "method max" do
    subject {["a", "abcdfeg", "abc", "abc", "ab", "abcd", "abcdf"]}
    it "return max value in the array of strings" do
      expect(subject.my_max).to eq(subject.max)
    end

    it "return max value if block is passed" do
      expect(subject.my_max{|a, b| a.length <=> b.length }).to eq subject.max{|a, b| a.length <=> b.length }
    end

    it "return array if block and argument are passed" do
      expect(subject.my_max(2){|a, b| a.length <=> b.length }).to eq subject.max(2){|a, b| a.length <=> b.length }
    end

    it "return array if argument is passed" do
      expect(subject.my_max(2)).to eq subject.max(2)
    end
  end
end