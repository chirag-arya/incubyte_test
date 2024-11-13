class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    # Check if there's a custom delimiter
    if numbers.start_with?("//")
      delimiter, numbers = parse_custom_delimiter(numbers)
      numbers_array = numbers.split(delimiter)
    else
      # Default delimiters are comma or newline
      numbers_array = numbers.split(/[\n,]+/)
    end

    # Convert to integers
    numbers_array.map!(&:to_i)

    # Sum the numbers
    result = numbers_array.sum

    # negative numbers
    negatives = numbers_array.select { |num| num < 0 }
    if negatives.any?
      raise "Negative numbers not allowed: #{negatives.join(', ')}"
    end

    result
  end

  private

  # Parse custom delimiter (e.g., //;\n1;2;3)
  def self.parse_custom_delimiter(numbers)
    delimiter_line, numbers = numbers.split("\n", 2)  # Split the first line (delimiter definition)
    delimiter = delimiter_line[2..-1]  # Remove the leading "//"
    delimiter = Regexp.escape(delimiter)  # Escape the delimiter to use in the regular expression
    [delimiter, numbers]
  end
end
