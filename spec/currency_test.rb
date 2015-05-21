require "minitest/autorun"
require_relative '../lib/currency'

class CurrencyTest < Minitest::Test

  def test_currency_exists
    assert(Currency)
  end

  def test_currency_takes_input
    test = Currency.new('USD', 1.05)
    assert_equal('USD', test.code)
    assert_equal(1.05, test.amount)
  end

  def test_currency_equals_same
    currency1 = Currency.new('EUR', 5.75)
    currency2 = Currency.new('EUR', 5.75)
    assert_equal(currency1.code, currency2.code)
    assert_equal(currency2.amount, currency2.amount)
  end

  def test_currency_doesnt_equal_diff
    currency1 = Currency.new('EUR', 4.00)
    currency2 = Currency.new('USD', 3.00)
    refute_equal(currency1.code, currency2.code)
    refute_equal(currency1.amount, currency2.amount)
  end


end
