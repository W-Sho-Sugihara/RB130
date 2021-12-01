class Series
  def initialize(number)
    @number = number.reverse.to_i.digits
  end

  def slices(num)
    raise ArgumentError if num > @number.size
    arr_results = []
    index = 0
     loop do
       arr = @number[index...(index + num)]
       arr_results << arr
      break if index + num == @number.size
      index += 1
     end
     arr_results
  end
end