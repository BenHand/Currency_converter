class Currency
  attr_accessor :code, :amount

  def initialize(code, amount)
    @code = code
    @amount = amount
    @currencies = {}
  end



  def ==(other)

    if other.is_a?(Currency) && other.code == @code
      return true
    else
      return false
    end

  end

  def +(other)

    if other.is_a?(Currency) && other.code == @code
      @amount + other.amount
    else
      raise DifferentCurrencyCodeError
    end

  end

  def -(other)

    if other.is_a?(Currency) && other.code == @code
      @amount - other.amount
    else
      raise DifferentCurrencyCodeError
    end

  end

  def *(number)
    if number.is_a?(Fixnum)
      @amount *= number
      @currencies[@code] = @amount
      @currencies
    else number.is_a?(Float)
      @amount *= number
      @currencies[@code] = @amount.round(5)
      @currencies
    end


  end

end

class DifferentCurrencyCodeError < StandardError
end
