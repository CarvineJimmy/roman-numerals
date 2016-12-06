require "roman_numerals/version"

module RomanNumerals
  def RomanNumerals.numberToNumerals(input)
    return RomanNumerals.powerOf10ToNumerals(input)
  end

  private

  def RomanNumerals.powerOf10ToNumerals(input)
    base = input.to_s[0].to_i
    exponent = Math.log10(input / base).to_i
    # raise "input must be a power of 10" unless exponent == Math.log10(input / base)
    numeral = RomanNumerals.numeralForExponent(exponent)
    fifthNumeral = RomanNumerals.fifthNumeralForExponent(exponent)

    if base <= 3
      return numeral * base
    elsif base == 4
      return numeral + fifthNumeral
    elsif base <= 8
      return fifthNumeral + numeral * (base - 5)
    elsif base == 9
      return numeral + RomanNumerals.numeralForExponent(exponent + 1)
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
