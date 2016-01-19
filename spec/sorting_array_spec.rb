require "rspec"
require "./sorting_array.rb"

describe "Methods for sorting array" do

  describe "sorting array of the numbers" do
    subject{[10, 4, 7, 2, 6, 5, 3]}
    context "even/odd" do
      it "return the array sorted by even/odd" do
        expect(subject.my_sort_by_even).to eq([10, 4, 2, 6, 7, 5, 3])
      end
    end

    context "reverse" do
      it "return the array in reversed order" do
        expect(subject.my_reverse).to eq(subject.reverse)
      end
    end
  end

  describe "sorting array of the strings" do
    subject {["1", "7777777", "333", "333", "22", "4444", "55555"]}

    context "by length" do
      it "return the array of the strings sorted by length" do
        expect(subject.my_sort_by_length).to eq subject.max_by(subject.size){|x| x.length}
      end
    end
  end
end