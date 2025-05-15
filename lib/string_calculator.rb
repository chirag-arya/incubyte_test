class StringCalculator
  def self.add(numbers)
    return 0 if numbers.blank?

    # Check if there's a custom delimiter
    if numbers.start_with?("//")
      delimiter, rest_of_numbers = numbers.split("\n", 2)
      delimiter = delimiter[2..-1]  # Remove the leading "//" part
    else
      delimiter = /[,\n]/
      rest_of_numbers = numbers
    end

    # Split the numbers using the delimiter (which could be a pipe `|`)
    numbers_array = rest_of_numbers.split(delimiter).map(&:to_i)

    # negative numbers
    negatives = numbers_array.select { |num| num < 0 }
    if negatives.any?
      raise "Negative numbers not allowed: #{negatives.join(', ')}"
    end

    # Sum the numbers
    result = numbers_array.sum

    result
  end
end
