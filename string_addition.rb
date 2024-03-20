def add(numbers)
  raise ArgumentError, "Invalid format" if numbers.include?(",\n") || numbers.include?("\n,")
  delimiter = ",|\n"
  if numbers.start_with?("//")
    delimiter, numbers = numbers[2..-1].split("\n")
    delimiter = Regexp.escape(delimiter)
  end

  numbers_array = numbers.split(/#{delimiter}/).map(&:to_i)
  negatives = numbers_array.select { |num| num < 0 }
  raise ArgumentError, "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
  raise ArgumentError if numbers.match?(/[^\d#{delimiter}]/) # raise an error if the string contains non-numeric characters/incorrect delimiter/negative numbers
  numbers_array.reduce(0, :+)
rescue ArgumentError => e
  puts e.message
end

# puts "#{add("//;\n1;2;-3;-4;5;-6")}"