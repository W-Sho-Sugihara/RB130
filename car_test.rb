require 'minitest/autorun'
# require 'minitest/reporters'

# Minitest::Reporters.use!


require_relative 'car'

# sub-section assertion or assert-style syntax


class CarTest < MiniTest::Test

  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  def test_bad_wheels
    skip                        # use `skip` to skip over test assertions
    car = Car.new
    assert_equal(3, car.wheels)
  end
end





# sub-section expectation matchers

describe 'Car#wheels' do        # using describe blocks
  it 'has 4 wheels' do          # using an `it` method
    car = Car.new
    _(car.wheels).must_equal 4           # this is the expectation
  end
end