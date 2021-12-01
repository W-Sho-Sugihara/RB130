class SumOfMultiples
  DEFAULT_MULTIPLES = [3, 5]

  def initialize(*arr)
    @multiples = arr
  end

  def self.to(num, arr = DEFAULT_MULTIPLES)
    results = []
    (1...num).each do |int|
      arr.each do |multiple|
        next unless int % multiple == 0 
        results << int
        break
      end
    end
    results.sum
  end

  def to(num)
    self.class.to(num, @multiples)
  end
end