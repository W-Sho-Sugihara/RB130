require 'minitest/autorun'
require 'minitest/reporters'
require 'simplecov'

# SimpleCov.start
MiniTest::Reporters.use!

require_relative "cash_register"
require_relative "transaction"

class CashRegisterTest < Minitest::Test
  def test_accept_money
    cash_register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20
    before_amount = cash_register.total_money
    cash_register.accept_money(transaction)
    after_amount = cash_register.total_money

    assert_equal(before_amount + 20, after_amount )
  end

  def test_change
    cash_register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 22

    assert_equal(cash_register.change(transaction), 2)
  end

  def test_give_receipt
    cash_register = CashRegister.new(1000)
    transaction = Transaction.new(20)
    transaction.amount_paid = 20

    assert_output("You've paid $20.\n"){cash_register.give_receipt(transaction)}
  end
end