class Currency
  attr_accessor :code, :amount

  def initialize(code, amount)
    @code = code
    @amount = amount
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
      new_amount = @amount * number
      Currency.new(@code, new_amount)
    else number.is_a?(Float)
      new_amount = @amount * number
      Currency.new(@code, new_amount)
    end

  end

end

class DifferentCurrencyCodeError < StandardError
end
