def add(numbers)
  numbers_array = numbers.split(/[\n,]/).map(&:to_i)
  negatives = numbers_array.select { |num| num < 0 }
  raise ArgumentError, "Negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
  raise ArgumentError if numbers.match?(/[^\d,\n]/) # raise an error if the string contains non-numeric characters/incorrect delimiter/negative numbers
  numbers_array.reduce(0, :+)
rescue ArgumentError => e
  puts e.message
end

puts "#{add("1\n2,3")}"