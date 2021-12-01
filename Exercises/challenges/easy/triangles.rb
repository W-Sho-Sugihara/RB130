=begin
  
Important details we need to keep in mind:

To be a valid triangle, each side length must be greater than 0.
To be a valid triangle, the sum of the lengths of any two sides must be greater than the length of the remaining side.
An equilateral triangle has three sides of equal length.
An isosceles triangle has exactly two sides of the equal length.
A scalene triangle has three sides of unequal length (no two sides have equal length).

  
=end

class Triangle
  attr_reader :sides, :type

  def initialize(side1, side2, side3)
    @sides = add_sides([side1, side2, side3])
    @type = add_type(sides)
  end

  def add_sides(arr)
    if arr.all?{ |side| side > 0 }
      arr
    else
      raise ArgumentError 
    end
  end

  def add_type(arr)
    return "equilateral" if equilateral?(arr)
    return "isosceles" if isosceles?(arr)
    return "scalene" if scalene?(arr)
  end

  def is_triangle?(arr)
    triangle = true
    3.times do
      triangle = false unless arr[0..1].sum > arr[2]
      arr = arr.rotate
    end
    triangle ? triangle : (raise ArgumentError)
  end

  def equilateral?(arr)
    is_triangle?(arr) && arr.uniq.size == 1
  end

  def isosceles?(arr)
    is_triangle?(arr) && arr.uniq.size == 2
  end

  def scalene?(arr)
    is_triangle?(arr) && arr.uniq.size == 3
  end

  def kind
    "#{type}"
  end
end