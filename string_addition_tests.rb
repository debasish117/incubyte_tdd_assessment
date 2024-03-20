require 'minitest/autorun'
# require_relative 'your_file' # replace 'your_file' with the actual file name where your add method is defined

class TestAddMethod < Minitest::Test
  def test_add_with_empty_string
    assert_equal 0, add('')
  end

  def add(numbers)
    numbers.split(',').map(&:to_i).reduce(0, :+)
  end
end