class StringCalc
  def add(numbers)
    return 0 if numbers.empty?
    
    delimiter, numbers_string = extract_val(numbers)
    number_array = parse_numbers(numbers_string, delimiter)
    
    validate_no_negatives(number_array)
    
    number_array.sum
  end
  
  private
  
  def extract_val(numbers)
    if numbers.start_with?("//")
      parts = numbers.split("\n", 2)
      delimiter = parts[0][2..-1]
      [delimiter, parts[1]]
    else
      [',', numbers]
    end
  end
  
  def parse_numbers(numbers, delimiter)
    numbers.split(/[#{Regexp.escape(delimiter)}\n]/).map(&:to_i)
  end
  
  def validate_no_negatives(numbers)
    negatives = numbers.select { |n| n < 0 }
    unless negatives.empty?
      raise ArgumentError, "negative numbers not allowed: #{negatives.join(', ')}"
    end
  end
end