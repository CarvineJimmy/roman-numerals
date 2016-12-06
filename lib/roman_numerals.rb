require "roman_numerals/version"

module RomanNumerals
  def RomanNumerals.numberToNumerals(input)
    raise "Input cannot be greater than 3000" unless input <= 3000
    output = ""
    while input != 0
      highestPowerOf10 = RomanNumerals.getHighestPowerOf10(input)
      output += RomanNumerals.powerOf10ToNumerals(highestPowerOf10)
      input -= highestPowerOf10
    end
    output
  end

  private

  def RomanNumerals.getHighestPowerOf10(input)
    base = input.to_s[0].to_i
    base * (10**(input.to_s.length - 1))
  end

#This must be passed a number that conforms to b * 10^x
  def RomanNumerals.powerOf10ToNumerals(input)
    base = input.to_s[0].to_i
    exponent = Math.log10(input / base).to_i
    numeral = RomanNumerals.numeralForExponent(exponent)
    fifthNumeral = RomanNumerals.fifthNumeralForExponent(exponent)

    if base <= 3
      numeral * base
    elsif base == 4
      numeral + fifthNumeral
    elsif base <= 8
      fifthNumeral + numeral * (base - 5)
    elsif base == 9
      numeral + RomanNumerals.numeralForExponent(exponent + 1)
    end
  end

  def RomanNumerals.numeralForExponent(exponent)
    return 'I' if exponent == 0
    return 'X' if exponent == 1
    return 'C' if exponent == 2
    return 'M' if exponent == 3
  end

  def RomanNumerals.fifthNumeralForExponent(exponent)
    return 'V' if exponent == 0
    return 'L' if exponent == 1
    return 'D' if exponent == 2
  end
end
