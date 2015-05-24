require "minitest/autorun"
require_relative '../lib/currency_converter'

class Currency_Converter_Test < Minitest::Test


  def test_currency_converter_exists
    assert(Currency_Converter)
  end

#Testing Currency_Converter takes hash input and returns expected values
  def test_converter_takes_hash_input
   assert_equal({'USD' => 1.00, 'EUR' => 0.74}, Currency_Converter.new({'USD' => 1.00, 'EUR' => 0.74}).currency_list)
  end

#Testing convert method takes currency and returns new currency object
#with exchanged rate.
  def test_convert_method
   convert_test = Currency_Converter.new({'USD' => 1.00, 'EUR' => 0.74}).convert( Currency.new('USD', 10), 'EUR' )
   assert_equal(convert_test, Currency.new('EUR', 7.40))
  end

#Testing Currency_Converter takes hash input with three distinct currency
#codes and amounts.
  def test_converter_takes_3_currencies
    assert_equal({'USD' => 1.00, 'EUR' => 0.74, 'JPY' => 120.0},
      Currency_Converter.new({'USD' => 1.00, 'EUR' => 0.74, 'JPY' => 120.0}).currency_list)
  end

#Testing Currency_Converter can perform exchange operation on any currency
#it knows to any other currency code it knows  -----{
  def test_converter_changes_EUR_JPY
    convert_test = Currency_Converter.new({'USD' => 1.00, 'EUR' => 0.74, 'JPY' => 120.0}).convert( Currency.new('EUR', 0.74), 'JPY' )
    assert_equal(convert_test, Currency.new('JPY', 162.2))
  end

  def test_converter_changes_JPY_USD
    convert_test = Currency_Converter.new({'USD' => 1.00, 'EUR' => 0.74, 'JPY' => 120.0}).convert( Currency.new('JPY', 120.0), 'USD' )
    assert_equal(convert_test, Currency.new('USD', 1.00))
  end
#                                             }-----

#Testing unknown currency throws back expected error response
  def test_converter_returns_error_for_unknown_currency
    assert_raises(UnknownCurrencyCodeError){Currency_Converter.new({'USD' => 1.00, 'JPY' => 120.0}).convert( Currency.new('JPY', 120.0), 'ALL' )}
  end

end
