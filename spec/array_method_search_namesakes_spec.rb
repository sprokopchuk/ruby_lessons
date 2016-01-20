require 'rspec'
require './array_method_search_namesakes.rb'


describe "Array method" do
  let(:arr1) {["sergey potap", "masha kononenko", "kilo rafic", "serg kononenko", "serg vals"]}
  let(:arr2) {["sergey potap", "masha kononenko", "kilo rafic", "serg kononenko", "petr potap", "kiod doo", "vasha potap"]}

  context "search_namesakes" do
    it "return array of 1 array with namesakes" do
      expect(arr1.search_namesakes).to eq [["masha kononenko", "serg kononenko"]]
    end

    it "return array of 2 arrays with namesakes" do
      expect(arr2.search_namesakes).to eq [["sergey potap", "petr potap", "vasha potap"], ["masha kononenko", "serg kononenko"]]
    end
  end
end