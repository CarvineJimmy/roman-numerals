class NumeralsToNumbers
  def NumeralsToNumbers.convert(numerals)
    value = 0
    while numerals.length != 0
      smallestValue = NumeralsToNumbers.parseSmallestNumber(numerals)

      numerals = numerals.reverse.sub(smallestValue.reverse, "").reverse

      value += NumeralsToNumbers.numeralToNumber(smallestValue)
    end
    value
  end

  def NumeralsToNumbers.parseSmallestNumber(numerals)
    return nil if numerals.size == 0
    return numerals if numerals.size == 1

    return numerals[-2..-1] if NumeralsToNumbers.isLessThan?(numerals[-2], numerals[-1])

    numerals.reverse.split("").reduce do |memo, numeral|
      if memo && memo[0] == numeral
        memo + numeral
      else
        memo
      end
    end
  end

  def NumeralsToNumbers.numeralToNumber(numerals)
    return NumeralsToNumbers.numericalValue(numerals) if numerals.length == 1

    return NumeralsToNumbers.numericalValue(numerals[0]) * numerals.length if numerals.split(numerals[0]) == []

    NumeralsToNumbers.numericalValue(numerals[-1]) - NumeralsToNumbers.numericalValue(numerals[-2])
  end

  def NumeralsToNumbers.isLessThan?(numeral1, numeral2)
    return NumeralsToNumbers.numericalValue(numeral1) < NumeralsToNumbers.numericalValue(numeral2)
  end

  def NumeralsToNumbers.numericalValue(numeral)
    return 1 if numeral == 'I'
    return 5 if numeral == 'V'
    return 10 if numeral == 'X'
    return 50 if numeral == 'L'
    return 100 if numeral == 'C'
    return 500 if numeral == 'D'
    return 1000 if numeral == 'M'
  end
end
