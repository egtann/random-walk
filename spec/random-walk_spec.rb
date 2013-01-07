require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "RandomWalk" do
  describe "generate" do
    it "returns results between given limits" do
      5.times do
        results = RandomWalk.generate(0..10, 1000)
        results.each do |result|
          result.should be >= 0
          result.should be <= 10
        end
      end
    end

    it "returns an array of the correct length" do
      results = RandomWalk.generate(100..200, 250)
      results.length.should == 250
    end
  end

  describe "generate_vectors" do
    let(:rw) { RandomWalk.new }

    it "returns results between given limits" do
      5.times do
        rw.generate_vectors(0..10, 0..10, 1000)
        rw.x.each do |result|
          result.should be >= 0
          result.should be <= 10
        end
        rw.y.each do |result|
          result.should be >= 0
          result.should be <= 10
        end
      end
    end

    it "returns 2 arrays of the correct length" do
      rw.generate_vectors(0..99, 0..1023, 500)
      rw.x.length.should == 500
      rw.y.length.should == 500
    end
  end

  describe "fit_y_to_x" do
    let(:rw) { RandomWalk.new }

    it "fits the y array to the x array perfectly" do
      rw.generate_vectors(0..99, 250..1000, 500)
      fit_chance = 100
      rw.fit_y_to_x(fit_chance)
      diff_x, diff_y = 0, 0
      rw.x.each_with_index do |result, i|
        if rw.x[i+1]
          diff_x += rw.x[i] - rw.x[i+1]
          diff_y += rw.y[i] - rw.y[i+1]
        end
      end
      diff_x.should == diff_y
    end
  end
end
