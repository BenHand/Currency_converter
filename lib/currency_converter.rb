require_relative '../lib/currency'

class Currency_Converter
attr_accessor :currency_list

  def initialize(currency_list)
    @currency_list = currency_list
  end

  def convert(known_currency, currency_code)
    requested_currency = @currency_list[currency_code]
    exchanged_amount = known_currency.amount * requested_currency
    Currency.new(currency_code, exchanged_amount)
  end

end
