require "roman_numerals"

describe RomanNumerals do
  describe 'numberToNumerals' do
    it 'converts 1 to I' do
      expect(RomanNumerals.numberToNumerals(1)).to eq("I")
    end

    it 'converts 2 to II' do
      expect(RomanNumerals.numberToNumerals(2)).to eq("II")
    end

    it 'converts 3 to III' do
      expect(RomanNumerals.numberToNumerals(3)).to eq("III")
    end

    it 'converts 4 to IV' do
      expect(RomanNumerals.numberToNumerals(4)).to eq("IV")
    end

    it 'converts 5 to V' do
      expect(RomanNumerals.numberToNumerals(5)).to eq("V")
    end

    it 'converts 6 to VI' do
      expect(RomanNumerals.numberToNumerals(6)).to eq("VI")
    end

    it 'converts 7 to VII' do
      expect(RomanNumerals.numberToNumerals(7)).to eq("VII")
    end

    it 'converts 8 to VIII' do
      expect(RomanNumerals.numberToNumerals(8)).to eq("VIII")
    end

    it 'converts 9 to IX' do
      expect(RomanNumerals.numberToNumerals(9)).to eq("IX")
    end

    it 'converts 10 to X' do
      expect(RomanNumerals.numberToNumerals(10)).to eq("X")
    end

    it 'converts 111 to CXI' do
      expect(RomanNumerals.numberToNumerals(111)).to eq("CXI")
    end

    it 'converts 526 to DXXVI' do
      expect(RomanNumerals.numberToNumerals(526)).to eq("DXXVI")
    end

    it 'converts 1999 to MCMXCIX' do
      expect(RomanNumerals.numberToNumerals(1999)).to eq("MCMXCIX")
    end

    it 'converts 2449 to MMCDXLIX' do
      expect(RomanNumerals.numberToNumerals(2449)).to eq("MMCDXLIX")
    end

    it 'converts 3000 to MMM' do
      expect(RomanNumerals.numberToNumerals(3000)).to eq("MMM")
    end

    it 'errors on numbers greater than 3000' do
      expect { RomanNumerals.numberToNumerals(3001) }.to raise_error("Input cannot be greater than 3000")
    end
  end

  describe 'powerOf10ToNumerals' do
    it 'converts 5 to V' do
      expect(RomanNumerals.powerOf10ToNumerals(5)).to eq("V")
    end

    it 'converts 10 to X' do
      expect(RomanNumerals.powerOf10ToNumerals(10)).to eq("X")
    end

    it 'converts 50 to L' do
      expect(RomanNumerals.powerOf10ToNumerals(50)).to eq("L")
    end

    it 'converts 100 to C' do
      expect(RomanNumerals.powerOf10ToNumerals(100)).to eq("C")
    end

    it 'converts 500 to D' do
      expect(RomanNumerals.powerOf10ToNumerals(500)).to eq("D")
    end

    it 'converts 1000 to M' do
      expect(RomanNumerals.powerOf10ToNumerals(1000)).to eq("M")
    end
  end

  describe 'numeralForExponent' do
    it 'returns I for 0' do
      expect(RomanNumerals.numeralForExponent(0)).to eq("I")
    end

    it 'returns X for 1' do
      expect(RomanNumerals.numeralForExponent(1)).to eq("X")
    end

    it 'returns C for 2' do
      expect(RomanNumerals.numeralForExponent(2)).to eq("C")
    end

    it 'returns M for 3' do
      expect(RomanNumerals.numeralForExponent(3)).to eq("M")
    end
  end

  describe 'fifthNumeralForExponent' do
    it 'returns V for 0' do
      expect(RomanNumerals.fifthNumeralForExponent(0)).to eq("V")
    end

    it 'returns L for 1' do
      expect(RomanNumerals.fifthNumeralForExponent(1)).to eq("L")
    end

    it 'returns D for 2' do
      expect(RomanNumerals.fifthNumeralForExponent(2)).to eq("D")
    end
  end

  describe 'getHighestPowerOf10' do
    it 'works with a number in thousands' do
      expect(RomanNumerals.getHighestPowerOf10(2536)).to eq(2000)
    end

    it 'works with a number in hundreds' do
      expect(RomanNumerals.getHighestPowerOf10(536)).to eq(500)
    end

    it 'works with a number in tens' do
      expect(RomanNumerals.getHighestPowerOf10(36)).to eq(30)
    end

    it 'works with a number in ones' do
      expect(RomanNumerals.getHighestPowerOf10(6)).to eq(6)
    end
  end

  describe 'numberBase' do
    it 'calculates proper base' do
      expect(RomanNumerals.numberBase(2536)).to eq(2)
      expect(RomanNumerals.numberBase(536)).to eq(5)
      expect(RomanNumerals.numberBase(36)).to eq(3)
      expect(RomanNumerals.numberBase(6)).to eq(6)
    end
  end
end
