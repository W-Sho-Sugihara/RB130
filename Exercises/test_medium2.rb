require 'minitest/autorun'
# require 'minitest/reporters'
# require 'simplecov'

# SimpleCov.start
# MiniTest::Reporters.use!

require_relative "medium2"

class MediumTest < MiniTest::Test
  def setup
    @file = File.open('sample_text.txt')
  end

  def test_swap
    file = @file.read
    swapped_file = file.gsub('a', 'e')
    text = Text.new(file)

    assert_equal(swapped_file, text.swap('a', 'e'))
  end

  def test_word_count
    text = Text.new(@file.read)
    assert_equal( 72, text.word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end
