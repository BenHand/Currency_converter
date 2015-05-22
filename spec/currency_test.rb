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

  def test_currency_equals_equals_true
    currency1 = Currency.new('USD', 5.00)
    currency2 = Currency.new('USD', 3.45)
    test = currency1.==(currency2)
    assert_equal(true, test )
  end

  def test_currency_equals_equals_false
    currency1 = Currency.new('EUR', 5.00)
    currency2 = Currency.new('USD', 3.45)
    test = currency1.==(currency2)
    assert_equal(false, test )
  end

  # def test_addition_method
  #   currency1 = Currency.new('USD', 5.00)
  #   currency2 = Currency.new('USD', 3.45)
  #   test = currency1.+(currency2)
  #   assert_equal(8.45, test)
  # end

end
