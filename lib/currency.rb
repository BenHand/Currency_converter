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
      other.amount + @amount
    end

  end

end


