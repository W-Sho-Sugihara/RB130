require 'minitest/autorun'
# require 'minitest/reporters'
# require 'simplecov'

# SimpleCov.start
# MiniTest::Reporters.use!

require_relative "transaction"

class TransactionTest < MiniTest::Test
  def test_prompt_for_payment
    trans = Transaction.new(20)
    input = StringIO.new('20\n')
    output = StringIO.new
    item_cost = 20
    trans.prompt_for_payment(input: input, output: output)
    # assert_output("You owe $#{item_cost}.\nHow much are you paying?\n"){trans.prompt_for_payment(input: input)}
    assert_equal(20, trans.amount_paid)
  end
end

