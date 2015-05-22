require "minitest/autorun"
require_relative '../lib/currency'

class CurrencyTest < Minitest::Test

#Testing that class Currency exists
  def test_currency_exists
    assert(Currency)
  end

#Testing class currency takes input
  def test_currency_takes_input
    test = Currency.new('USD', 1.05)
    assert_equal('USD', test.code)
    assert_equal(1.05, test.amount)
  end

#Testing two currencies with same arguments = eachother
  def test_currency_equals_same
    currency1 = Currency.new('EUR', 5.75)
    currency2 = Currency.new('EUR', 5.75)
    assert_equal(currency1.code, currency2.code)
    assert_equal(currency2.amount, currency2.amount)
  end

#Testing two currencies with diff arguments != eachother
  def test_currency_doesnt_equal_diff
    currency1 = Currency.new('EUR', 4.00)
    currency2 = Currency.new('USD', 3.00)
    refute_equal(currency1.code, currency2.code)
    refute_equal(currency1.amount, currency2.amount)
  end

#Testing custom "==" method returns true when appropriate
  def test_currency_equals_equals_true
    currency1 = Currency.new('USD', 5.00)
    currency2 = Currency.new('USD', 3.45)
    test = currency1 == currency2
    assert_equal(true, test )
  end

#Testing custom "==" method returns false when appropriate
  def test_currency_equals_equals_false
    currency1 = Currency.new('EUR', 5.00)
    currency2 = Currency.new('USD', 3.45)
    test = currency1 == currency2
    assert_equal(false, test )
  end

#Testing custom "+" method returns expected value
  def test_addition_method
    currency1 = Currency.new('USD', 5.00)
    currency2 = Currency.new('USD', 3.45)
    test = currency1 + currency2
    assert_equal(8.45, test)
  end

#Testing custom "-" method returns expected value
  def test_subtraction_method
    currency1 = Currency.new('USD', 8.00)
    currency2 = Currency.new('USD', 4.45)
    test = currency1 - currency2
    assert_equal(3.55, test)
  end
#Testing "-" raises error when currency codes are not equal
  def test_subtraction_error
    currency1 = Currency.new('EUR', 8.00)
    currency2 = Currency.new('USD', 4.45)
    assert_raises(DifferentCurrencyCodeError){currency1 - currency2}
  end

#Testing "+" raises error when currency codes are not equal
  def test_subtraction_error
    currency1 = Currency.new('EUR', 8.00)
    currency2 = Currency.new('USD', 4.45)
    assert_raises(DifferentCurrencyCodeError){currency1 + currency2}
  end

#Testing custom multiplication method using Fixnum returns hash
#with expected code and amount
  def test_multiplier_fixnum
    currency = Currency.new('USD', 1.00)
    assert_equal({"USD"=>5.0}, (currency * 5))
  end

#Testing custom multiplication method using Float returns hash
#with expected code and amount.round(5)
  def test_multiplier_float
    currency = Currency.new('USD', 1.11)
    assert_equal({"USD"=>5.8275}, (currency * 5.25))
  end

end
