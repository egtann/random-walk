require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RandomWalk" do
  it "returns results between given limits" do
    5.times do
      results = RandomWalk.generate(0..10, 1000)
      results.each do |result|
        (result.should be >= 0) && (result.should be <= 10)
      end
    end
  end

  it "returns an array of the correct length" do
    results = RandomWalk.generate(100..200, 250)
    results.length.should == 250
  end
end
