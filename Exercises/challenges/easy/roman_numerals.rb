=begin
I stands for 1
V stands for 5
X stands for 10
L stands for 50
C stands for 100
D stands for 500
M stands for 1,000
=end

class RomanNumeral
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_roman
    digits = @number.digits
   
    romanized = digits.map.with_index do |num, i|
      if num == 0
        nil
      else
        case i
        when 0 then ones(num)
        when 1 then tens(num)
        when 2 then hundreds(num)
        when 3 then thousands(num)
        end
      end
    end
    romanized.reverse.join
  end

  def ones(num)
    case num
    when (1..3) then "I" * num
    when 4      then "IV"
    when (5..8) then "V" + ("I" * (num - 5))
    when 9      then "IX"
    end
  end

  def tens(num)
    case num
    when (1..3) then "X" * num
    when 4      then "XL"
    when (5..8) then "L" + ("X" * (num - 5))
    when 9      then "XC"
    end
  end

  def hundreds(num)
    case num
    when (1..3) then "C" * num
    when 4      then "CD"
    when (5..8) then "D" + ("C" * (num - 5))
    when 9      then "CM"
    end
  end

  def thousands(num)
    "M" * num
  end
end