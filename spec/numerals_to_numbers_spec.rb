require 'numerals_to_numbers'

describe NumeralsToNumbers do
  describe 'convert' do
    it 'returns 526 when passed DXXVI' do
      expect(NumeralsToNumbers.convert("DXXVI")).to eq(526)
    end

      it 'returns 1999 when passed MCMXCIX' do
        expect(NumeralsToNumbers.convert("MCMXCIX")).to eq(1999)
      end

      it 'returns 2449 when passed MMCDXLIX' do
        expect(NumeralsToNumbers.convert("MMCDXLIX")).to eq(2449)
      end
  end

  describe 'parseSmallestNumber' do
      it 'returns nil when passed an empty string' do
        expect(NumeralsToNumbers.parseSmallestNumber("")).to eq(nil)
      end

      it 'returns correct value for one numeral' do
        expect(NumeralsToNumbers.parseSmallestNumber("X")).to eq("X")
      end

      it 'returns correct value for two numerals' do
        expect(NumeralsToNumbers.parseSmallestNumber("CM")).to eq("CM")
      end

      it 'returns correct value for two repeating numerals' do
        expect(NumeralsToNumbers.parseSmallestNumber("MM")).to eq("MM")
      end

      it 'returns correct value for three repeating numerals' do
        expect(NumeralsToNumbers.parseSmallestNumber("XXX")).to eq("XXX")
      end
  end

  describe 'numeralToNumber' do
      it 'returns correct value for one numeral' do
        expect(NumeralsToNumbers.numeralToNumber("X")).to eq(10)
      end

      it 'returns correct value for two numerals' do
        expect(NumeralsToNumbers.numeralToNumber("CM")).to eq(900)
      end

      it 'returns correct value for three repeating numerals' do
        expect(NumeralsToNumbers.numeralToNumber("XXX")).to eq(30)
      end
  end

  describe 'isLessThan?' do
      it 'returns true for less than' do
        expect(NumeralsToNumbers.isLessThan?("I", "V")).to eq(true)
        expect(NumeralsToNumbers.isLessThan?("X", "L")).to eq(true)
      end

      it 'returns false for equal' do
        expect(NumeralsToNumbers.isLessThan?("V", "V")).to eq(false)
      end

      it 'returns false for greater than' do
        expect(NumeralsToNumbers.isLessThan?("L", "X")).to eq(false)
        expect(NumeralsToNumbers.isLessThan?("M", "C")).to eq(false)
      end
  end

  describe 'numericalValue' do
    it 'converts I' do
      expect(NumeralsToNumbers.numericalValue('I')).to eq(1)
    end

    it 'converts V' do
      expect(NumeralsToNumbers.numericalValue('V')).to eq(5)
    end

    it 'converts X' do
      expect(NumeralsToNumbers.numericalValue('X')).to eq(10)
    end

    it 'converts L' do
      expect(NumeralsToNumbers.numericalValue('L')).to eq(50)
    end

    it 'converts C' do
      expect(NumeralsToNumbers.numericalValue('C')).to eq(100)
    end

    it 'converts D' do
      expect(NumeralsToNumbers.numericalValue('D')).to eq(500)
    end

    it 'converts M' do
      expect(NumeralsToNumbers.numericalValue('M')).to eq(1000)
    end
  end
end
