require 'rspec'
require './hash_method_merge.rb'

=begin
merge(other_hash) → new_hash
merge(other_hash){|key, oldval, newval| block} → new_hash
Returns a new hash containing the contents of other_hash and the contents of hsh.
If no block is specified, the value for entries with duplicate keys will be
that of other_hash. Otherwise the value for each duplicate key is determined
by calling the block with the key, its value in hsh and its value in other_hash.

h1 = { "a" => 100, "b" => 200 }
h2 = { "b" => 254, "c" => 300 }
h1.merge(h2)   #=> {"a"=>100, "b"=>254, "c"=>300}
h1.merge(h2){|key, oldval, newval| newval - oldval}
               #=> {"a"=>100, "b"=>54,  "c"=>300}
h1             #=> {"a"=>100, "b"=>200}
=end


describe "Hash methods" do
  let(:h1) {{ "a" => 100, "b" => 200 }}
  let(:h2) {{ "b" => 254, "c" => 300 }}

  context "merge" do
    it "return megred hash" do
      expect(h1.my_merge(h2)).to eq h1.merge(h2)
    end

    it "return megred hash if block is passed" do
      expect(h1.my_merge(h2){|key, oldval, newval| newval - oldval}).to eq h1.merge(h2){|key, oldval, newval| newval - oldval}
    end
  end
end