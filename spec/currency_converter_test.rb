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

#Testing convert method takes currency and returns converted value as expected
  def test_convert_method
   convert_test = Currency_Converter.new({'USD' => 1.00, 'EUR' => 0.74}).convert( Currency.new('USD', 10), 'EUR' )
   assert_equal(convert_test, Currency.new('EUR', 7.40).amount)
  end


end
