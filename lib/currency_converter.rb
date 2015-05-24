require_relative '../lib/currency'

class UnknownCurrencyCodeError < StandardError
end

class Currency_Converter
attr_accessor :currency_list

  def initialize(currency_list)
    @currency_list = currency_list
  end

  def convert(known_currency, currency_code)

    if @currency_list[currency_code].nil? then raise UnknownCurrencyCodeError

      else
        requested_currency = @currency_list[currency_code]

        if known_currency.amount > requested_currency
          exchanged_amount = known_currency.amount * requested_currency
          Currency.new(currency_code, exchanged_amount)

        else ( known_currency.amount != 1 ) && ( known_currency.amount < requested_currency )
          exchanged_amount = requested_currency / known_currency.amount
          Currency.new(currency_code, exchanged_amount)

        end

      end

  end

end
