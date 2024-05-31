class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers[4..]
    else
      delimiter = /,|\n/
    end

    num_array = numbers.split(delimiter).map(&:to_i)
    negatives = num_array.select { |n| n < 0 }
    unless negatives.empty?
      raise "negative numbers not allowed: #{negatives.join(', ')}"
    end

    num_array.sum
  end
end
