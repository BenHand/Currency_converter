class Currency
  attr_accessor :code, :amount

  def initialize(code, amount)
    @code = code
    @amount = amount
  end

  # def +(other)

  #   if Currency ==(other)
  #     total_amount = other.amount.to_i += @amount.to_i
  #     total_amount
  #   end

  end

  def ==(other)

    if other.is_a?(Currency) && other.code == @code
      return true
    else
      return false
    end

  end

end


