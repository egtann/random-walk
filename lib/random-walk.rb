class RandomWalk
  attr_accessor :x, :y

  def self.generate(limits, array_length)
    starting_point = Random.rand(limits)
    output_array = [starting_point]
    (array_length - 1).times do
      add_or_subtract = Random.rand(-1..1)
      end_point = output_array.last + add_or_subtract
      if end_point <= limits.max && end_point >= limits.min
        output_array << end_point
      else
        output_array << output_array.last
      end
    end
    return output_array
  end

  def generate_vectors(x_limits, y_limits, vector_length)
    self.x = RandomWalk.generate(x_limits, vector_length)
    self.y = RandomWalk.generate(y_limits, vector_length)
  end

  def fit_y_to_x(fit_chance)
    raise 'Fit chance must be between 0 and 100' unless fit_chance <= 100 && fit_chance >= 0
    self.x.each_with_index do |value, i|
      if self.x[i] && self.x[i+1]
        x_diff = self.x[i] - self.x[i+1]
        rand = Random.rand(100 / fit_chance)
        if rand == 0
          self.y[i+1] = self.y[i] - x_diff
        end
      end
    end
  end
end
