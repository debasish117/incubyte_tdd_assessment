require 'minitest/autorun'
# require_relative 'your_file' # replace 'your_file' with the actual file name where your add method is defined

class TestAddMethod < Minitest::Test
  def test_add_with_empty_string
    assert_equal 0, add('')
  end

  def test_add_with_two_numbers
    assert_equal 7, add('3,4')
  end

  def test_add_with_three_numbers
  assert_equal 7, add('3,4,''')
  end

  def test_add_with_non_string_input
    assert_raises(NoMethodError) { add(123) }
  end

  def test_add_with_non_numeric_characters
    assert_raises(ArgumentError) { add('3,a') }
  end

  def test_add_with_incorrect_delimiter
    assert_raises(ArgumentError) { add('3 4') }
  end

  def test_add_with_negative_numbers
    assert_raises(ArgumentError) { add('3,-4') }
  end

  def add(numbers)
    numbers_array = numbers.split(',').map(&:to_i)
    negatives = numbers_array.select { |num| num < 0 }
    raise ArgumentError, "Negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
    raise ArgumentError if numbers.match?(/[^\d,]/) # raise an error if the string contains non-numeric characters/incorrect delimiter/negative numbers
    numbers_array.reduce(0, :+)
  end
end