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

  it "uses a default step size of 1" do
    results = RandomWalk.generate(0..10, 1000, 1)
    previous_result = results.first
    results.each do |result|
      (previous_result-1..previous_result+1).should cover(result)
      previous_result = result
    end
  end

  it "uses steps of the specified size" do
    results = RandomWalk.generate(0..10, 1000, 5)
    previous_result = results.first
    results.each do |result|
      (previous_result-5..previous_result+5).should cover(result)
      previous_result = result
    end
  end
end
