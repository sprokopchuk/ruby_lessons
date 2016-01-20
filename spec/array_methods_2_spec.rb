require "rspec"
require "./array_methods_2.rb"

describe "Array methods via reduce" do
  subject {[10, 4, 5]}


  context "count" do
    it "return size of the Array" do
      expect(subject.r_count).to eq subject.count
    end

    it "return size of the Array" do
      subject = []
      expect(subject.r_count).to eq subject.count
    end
  end

  context "any?" do
    it "return true if any element is more than 4" do
      expect(subject.r_any?{|x| x > 4}).to eq(subject.any?{|x| x > 4})
    end

    it "return false if any element is less than 4" do
      expect(subject.r_any?{|x| x < 4}).to eq(subject.any?{|x| x < 4})
    end

    it "return false if array is empty" do
      subject = []
      expect(subject.r_any?).to eq(subject.any?)
    end
  end

  context "all?" do
    it "return false if any element is nil or false" do
      subject << nil
      expect(subject.r_all?).to eq subject.all?
    end

    it "return false if any element is less than 4" do
      expect(subject.r_all?{|x| x > 4}).to eq(subject.all?{|x| x > 4})
    end

    it "return false if any element is more than 4" do
      expect(subject.r_all?{|x| x < 4}).to eq(subject.all?{|x| x < 4})
    end

    it "return true if all elements are more than 3" do
      expect(subject.r_all?{|x| x > 3}).to eq(subject.all?{|x| x > 3})
    end

    it "return true if array is empty" do
      subject = []
      expect(subject.r_all?).to eq subject.all?
    end
  end

  context "select" do

    it "return elements are more than 4" do
      expect(subject.r_select{|x| x > 4}).to eq(subject.select{|x| x > 4})
    end

    it "return elements are less than 5" do
      expect(subject.r_select{|x| x < 5}).to eq(subject.select{|x| x < 5})
    end

    it "return Enumerator if no block is given" do
      expect(subject.r_select.class).to eq subject.select.class
    end

  end

  context "map" do
    it "return elements multiplied by 4" do
      expect(subject.r_map{|x| x * 4}).to eq(subject.map{|x| x * 4})
    end

    it "return Enumerator if no block is given" do
      expect(subject.r_map.class).to eq subject.map.class
    end
  end

end

