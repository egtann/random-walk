class RandomWalk
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
end
