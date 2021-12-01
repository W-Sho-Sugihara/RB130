class PerfectNumber

  def self.classify(number)
    number = number >= 0 ? number : (raise StandardError)
    sum_of_factors = 0
    1.upto(number/2) do |i|
      sum_of_factors += i if number % i == 0
    end
    if sum_of_factors > number
      "abundant"
    elsif sum_of_factors < number
      "deficient"
    else
      "perfect"
    end
  end
end