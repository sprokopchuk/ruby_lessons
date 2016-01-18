require "rspec"
require "./array_methods.rb"

describe "Array methods" do
  subject {[10, 4, 5]}


  context "count" do
    it "return size of the Array" do
      expect(subject.my_count).to eq subject.count
    end

    it "return size of the Array" do
      subject = []
      expect(subject.my_count).to eq subject.count
    end
  end

  context "any?" do
    it "return true if any element is more than 4" do
      expect(subject.my_any?{|x| x > 4}).to eq(subject.any?{|x| x > 4})
    end

    it "return false if any element is less than 4" do
      expect(subject.my_any?{|x| x < 4}).to eq(subject.any?{|x| x < 4})
    end

    it "return false if array is empty" do
      subject = []
      expect(subject.my_any?).to eq(subject.any?)
    end
  end

  context "all?" do
    it "return false if any element is nil or false" do
      subject << nil
      expect(subject.my_all?).to eq subject.all?
    end

    it "return false if any element is less than 4" do
      expect(subject.my_all?{|x| x > 4}).to eq(subject.all?{|x| x > 4})
    end

    it "return false if any element is more than 4" do
      expect(subject.my_all?{|x| x < 4}).to eq(subject.all?{|x| x < 4})
    end

    it "return true if all elements are more than 3" do
      expect(subject.my_all?{|x| x > 3}).to eq(subject.all?{|x| x > 3})
    end

    it "return true if array is empty" do
      subject = []
      expect(subject.my_all?).to eq subject.all?
    end
  end

  context "select" do

    it "return elements are more than 4" do
      expect(subject.my_select{|x| x > 4}).to eq(subject.select{|x| x > 4})
    end

    it "return elements are less than 5" do
      expect(subject.my_select{|x| x < 5}).to eq(subject.select{|x| x < 5})
    end

    it "return Enumerator if no block is given" do
      expect(subject.my_select.class).to eq subject.select.class
    end

  end

  context "map" do
    it "return elements multiplied by 4" do
      expect(subject.my_map{|x| x * 4}).to eq(subject.map{|x| x * 4})
    end

    it "return Enumerator if no block is given" do
      expect(subject.my_map.class).to eq subject.map.class
    end
  end

  context "reduce" do
    it "return sum of the elements" do
      expect(subject.my_reduce(:+)).to eq subject.reduce(:+)
    end

    it "return sum plus 1 of the elements" do
      expect(subject.my_reduce(1, :+)).to eq subject.reduce(1, :+)
    end

  end
end


=begin
reduce(initial, sym) → obj
reduce(sym) → obj
reduce(initial) { |memo, obj| block } → obj
reduce { |memo, obj| block } → obj
Combines all elements of enum by applying a binary operation,
specified by a block or a symbol that names a method or operator.

If you specify a block, then for each element in enum the block is
passed an accumulator value (memo) and the element. If you specify a
symbol instead, then each element in the collection will be passed to the
named method of memo. In either case, the result becomes the new value for memo.
 At the end of the iteration, the final value of memo is the return value for the method.

If you do not explicitly specify an initial value for memo, then the first
element of collection is used as the initial value of memo.
=end
