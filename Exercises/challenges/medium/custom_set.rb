class CustomSet
  attr_accessor :set

  def initialize(arr = [])
    @set = arr.uniq
  end

  def empty?
    set.empty?
  end

  def contains?(num)
    set.include?(num)
  end

  def subset?(other)
    set.all? { |num| other.contains?(num) }
  end

  def disjoint?(other)
    set.none? { |num| other.contains?(num) }
  end

  def eql?(other)
    set.all? { |num| other.contains?(num) } && 
    other.set.all? { |num| contains?(num) }
  end

  def add(num)
    set << num unless contains?(num)
    self
  end

  def ==(other)
    eql?(other)
  end

  def intersection(other)
    CustomSet.new(set.select { |num| other.contains?(num) })
  end

  def difference(other)
    CustomSet.new(set.select { |num| !other.contains?(num) })
  end

  def union(other)
    CustomSet.new(set.union(other.set))
  end
end

# p CustomSet.new([1,2,3]).intersection([3])