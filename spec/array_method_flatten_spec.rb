require 'rspec'
require './array_method_flatten.rb'


=begin
Returns a new array that is a one-dimensional flattening of self (recursively).

That is, for every element that is an array, extract its elements into the new array.

The optional level argument determines the level of recursion to flatten.

s = [ 1, 2, 3 ]           #=> [1, 2, 3]
t = [ 4, 5, 6, [7, 8] ]   #=> [4, 5, 6, [7, 8]]
a = [ s, t, 9, 10 ]       #=> [[1, 2, 3], [4, 5, 6, [7, 8]], 9, 10]
a.flatten                 #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
a = [ 1, 2, [3, [4, 5] ] ]
a.flatten(1)              #=> [1, 2, 3, [4, 5]]
=end

describe "Array methods" do
  subject {[[1, 2, 3], [4, 5, 6, [7, 8]], 9, 10]}
  context 'flatten' do
    it "return array that is a one-dimensional flattening of array" do
      expect(subject.my_flatten).to eq subject.flatten
    end

    it "return array that is a one-dimensional flattening of array if argument is passed" do
      expect(subject.my_flatten(1)).to eq subject.flatten(1)
    end
  end
end