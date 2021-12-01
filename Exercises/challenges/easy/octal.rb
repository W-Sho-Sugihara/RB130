class Octal
  attr_reader :num
  def initialize(num_string)
    @num = num_string
  end

  def to_decimal
    return 0 unless num.chars.all? { |n| ('0'..'7').include?(n) }
    digits = num.to_i.digits.map.with_index do |n, index|
      n * (8**index)
    end
    digits.sum
  end
end