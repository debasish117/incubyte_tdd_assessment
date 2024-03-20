def add(numbers)
  raise ArgumentError, "Invalid format" if numbers.include?(",\n") || numbers.include?("\n,")
  delimiter = ",|\n"
  if numbers.start_with?("//")
    delimiter, numbers = numbers[2..-1].split("\n")
    delimiter = Regexp.escape(delimiter)
  end

  numbers_array = numbers.split(/#{delimiter}/).map(&:to_i)
  negatives = numbers_array.select(&:negative?)
  raise ArgumentError, "Negative numbers not allowed: #{negatives.join(', ')}" if negatives.any?
  raise ArgumentError, "String contains non-numeric characters or incorrect delimiter" if numbers.match?(/[^\d#{delimiter}]/) # raise an error if the string contains non-numeric characters/incorrect delimiter
  numbers_array.sum
rescue ArgumentError => e
  puts e.message
end

puts "#{add("//;\n1;2;3;4;5;6")}"