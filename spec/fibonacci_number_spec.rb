require "rspec"
require "./fibonacci_number.rb"

describe "Fibonacci numbers" do
  it "return 3 for n = 4" do
    expect(fibonacci_number 4).to eq 3
  end

  it "return 144 for n = 12" do
    expect(fibonacci_number 12).to eq 144
  end

  it "return 377 for n = 14" do
    expect(fibonacci_number 14).to eq 377
  end
end